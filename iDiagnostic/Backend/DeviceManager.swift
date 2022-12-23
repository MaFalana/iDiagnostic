//
//  DeviceManager.swift
//  iDiagnostic
//
//  Created by Malik Falana on 12/23/22.
//

import Foundation
import UIKit
import Cocoa
import IOKit
import IOKit.serial


class DeviceManager: ObservableObject
{
    static let shared = DeviceManager()
    
//    static var serialNumber: String
//    {
//        return getSerialNumber()
//    }
//
//    static var storageCapacity: String
//    {
//        return getStorageCapacity()
//    }
//
//    static var deviceName: String
//    {
//        return getDeviceName()
//    }
//
//    static var batteryCapacity: String
//    {
//        return getBatteryCapacity()
//    }
    
    
    
    func getSerialNumber() -> String
    {
        let systemInfo = ProcessInfo.processInfo
        return systemInfo.globallyUniqueString
    }
    
    func getSystem() -> String
    {
        return UIDevice.current.serialNumber
    }

    func getStorageCapacity() -> String {
        let systemAttributes = try! FileManager.default.attributesOfFileSystem(forPath: "/")
        let capacity = systemAttributes[.systemSize] as! NSNumber 
        return "\(capacity) GB"
    }

    func getDeviceName() -> String
    {
        return Host.current().localizedName!
    }
    
    func getOSVersion() -> String
    {
        let systemInfo = ProcessInfo.processInfo
        return systemInfo.operatingSystemVersionString
    }
    
//    func getBatteryCapacity() -> String {
//        let batteryInfo = IOPSGetPowerSourceDescription(IOPSCopyPowerSourcesInfo().takeRetainedValue(), IOPSGetProvidingPowerSourceType(IOPSCopyPowerSourcesInfo().takeRetainedValue())).takeRetainedValue() as Dictionary
//        let capacity = batteryInfo[kIOPSMaxCapacityKey] as! NSNumber
//        return "\(capacity) mAh"
//    }
    
}
