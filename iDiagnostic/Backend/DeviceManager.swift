//
//  DeviceManager.swift
//  iDiagnostic
//
//  Created by Malik Falana on 12/23/22.
//

import Foundation
import Cocoa
import IOKit
import IOKit.serial
import IOKit.ps
import AppKit


class DeviceManager: ObservableObject
{
    static let shared = DeviceManager()
    
    let modelDescription = DeviceInfoHelper.getModelDescription()
    let serialNumber = DeviceInfoHelper.getSerialNumber()
    let model = DeviceInfoHelper.getModel()
    //let modelYear = DeviceInfoHelper.getModelYear()
    let modelIdentifier = DeviceInfoHelper.getModelIdentifier()
    //let partNumber = DeviceInfoHelper.getPartNumber()
    let modelNumber = DeviceInfoHelper.getModelNumber()
    let releaseYear = DeviceInfoHelper.getReleaseYear()
    let macOSVersion = DeviceInfoHelper.getMacOSVersion()
    let displaySize = DeviceInfoHelper.getDisplaySize()
    let ramCapacity = DeviceInfoHelper.getRAMCapacity()
    let processor = DeviceInfoHelper.getProcessor()
    let storageCapacity = DeviceInfoHelper.getHDDCapacity()
    //let color = DeviceInfoHelper.getColor()
    //let modelDimensions = DeviceInfoHelper.getModelDimensions()
    //let modelAverageWeight = DeviceInfoHelper.getModelAverageWeight()
    //let bluetooth = DeviceInfoHelper.getBluetooth()
    let airPort = DeviceInfoHelper.getAirPort()
}


struct DeviceInfoHelper
{
    static func getModelDescription() -> String // Code to retrieve and return model description
    {
        let command = "system_profiler SPHardwareDataType | grep \"Model Name\""
        let output = executeCommand(command: command)
        let model = output.components(separatedBy: ": ")[1] // Parse output to retrieve model
        return model
    }

    static func getSerialNumber() -> String // Code to retrieve and return serial number
    {
        let command = "system_profiler SPHardwareDataType | grep \"Serial Number\""
        let output = executeCommand(command: command)
        let serialNumber = output.components(separatedBy: ": ")[1] // Parse output to retrieve serial number
        return serialNumber
    }

    static func getModel() -> String  // Code to retrieve and return model
    {
        let command = "system_profiler SPHardwareDataType | grep \"Model Name\""
        let output = executeCommand(command: command)
        let model = output.components(separatedBy: ": ")[1] // Parse output to retrieve model
        return model
    }

    static func getModelYear() -> String // Code to retrieve and return model year
    {
        let command = "system_profiler SPHardwareDataType | grep \"Model Year\""
        let output = executeCommand(command: command)
        let modelYear = output.components(separatedBy: ": ")[1] // Parse output to retrieve model year
        return modelYear
    }

    static func getModelIdentifier() -> String // Code to retrieve and return model identifier
    {
        let command = "system_profiler SPHardwareDataType | grep \"Model Identifier\""
        let output = executeCommand(command: command)
        let modelIdentifier = output.components(separatedBy: ": ")[1] // Parse output to retrieve model identifier
        return modelIdentifier
    }

    static func getPartNumber() -> String // Code to retrieve and return part number
    {
        let command = "system_profiler SPHardwareDataType | grep \"Part Number\""
        let output = executeCommand(command: command)
        let partNumber = output.components(separatedBy: ": ")[1] // Parse output to retrieve part number
        return partNumber
    }

    static func getModelNumber() -> String // Code to retrieve and return model number
    {
        let command = "system_profiler SPHardwareDataType | grep \"Model Identifier\""
        let output = executeCommand(command: command)
        let modelNumber = output.components(separatedBy: ": ")[1] // Parse output to retrieve model number
        return modelNumber
    }

    static func getReleaseYear() -> String // Code to retrieve and return release year
    {
        let command = "system_profiler SPHardwareDataType | grep \"Release Year\""
        let output = executeCommand(command: command)
        if output.count < 2 { return ""}
        let releaseYear = output.components(separatedBy: ": ")[1]  // Parse output to retrieve release year
        return releaseYear
    }

    static func getMacOSVersion() -> String // Code to retrieve and return macOS version
    {
        let command = "sw_vers -productVersion"
        let output = executeCommand(command: command)
        return output
    }

    static func getDisplaySize() -> String // Code to retrieve and return display size
    {
        let command = "system_profiler SPDisplaysDataType | grep \"Resolution\""
        let output = executeCommand(command: command)
        let displaySize = output.components(separatedBy: ": ")[1] // Parse output to retrieve display size
        return displaySize
    }

    static func getRAMCapacity() -> String // Code to retrieve and return RAM capacity
    {
        let command = "system_profiler SPHardwareDataType | grep \"Memory\""
        let output = executeCommand(command: command)
        let ramCapacity = output.components(separatedBy: ": ")[1] // Parse output to retrieve RAM capacity
        return ramCapacity
    }

    static func getProcessor() -> String // Code to retrieve and return processor
    {
        let command = "sysctl -n machdep.cpu.brand_string"
        let output = executeCommand(command: command)
        return output
    }

    static func getHDDCapacity() -> String // Code to retrieve and return HDD capacity
    {
        let command = "diskutil info / | grep \"Total Size\""
        let output = executeCommand(command: command)
        let capacityComponents = output.components(separatedBy: ": ")
            if capacityComponents.count >= 2 {
                let hddCapacity = capacityComponents[1]
                return hddCapacity
            } else {
                return "Error: Unable to retrieve storage capacity."
            }
    }

    static func getColor() -> String // Code to retrieve and return color
    {
        let command = "system_profiler SPHardwareDataType | grep \"Color\""
        let output = executeCommand(command: command)
        let color = output.components(separatedBy: ": ")[1] // Parse output to retrieve color
        return color
    }

    static func getModelDimensions() -> String // Code to retrieve and return model dimensions
    {
        let command = "system_profiler SPHardwareDataType | grep \"Dimensions\""
        let output = executeCommand(command: command)
        let modelDimensions = output.components(separatedBy: ": ")[1]  // Parse output to retrieve model dimensions
        return modelDimensions
    }

    static func getModelAverageWeight() -> String // Code to retrieve and return model average weight
    {
        let command = "system_profiler SPHardwareDataType | grep \"Average Weight\""
        let output = executeCommand(command: command)
        let modelAverageWeight = output.components(separatedBy: ": ")[1] // Parse output to retrieve model average weight
        return modelAverageWeight
    }

    static func getBluetooth() -> String // Code to retrieve and return Bluetooth information
    {
        let command = "system_profiler SPBluetoothDataType | grep \"Bluetooth\""
        let output = executeCommand(command: command)
        let bluetooth = output.components(separatedBy: ": ")[1] // Parse output to retrieve Bluetooth information
        return bluetooth
    }

    static func getAirPort() -> String // Code to retrieve and return AirPort information
    {
        let command = "system_profiler SPAirPortDataType | grep \"AirPort\""
        let output = executeCommand(command: command)
        let airPort = output.components(separatedBy: ": ")[1] // Parse output to retrieve AirPort information
        return airPort
    }
    
        
    private static func executeCommand(command: String) -> String
    {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", command]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        if output.count > 0 {
            // remove newline character
            let lastIndex = output.index(before: output.endIndex)
            return String(output[output.startIndex ..< lastIndex])
        }
        return output
    }
}
