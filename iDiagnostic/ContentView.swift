//
//  ContentView.swift
//  iDiagnostic
//
//  Created by Malik Falana on 12/23/22.
//

import SwiftUI

struct ContentView: View
{
    let DM = DeviceManager.shared
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("Serial Number: \(DM.getSerialNumber())").font(.headline)
            Text("Storage Capacity: \(DM.getStorageCapacity()) GB").font(.subheadline)
            Text("Device Name: \(DM.getDeviceName())")
                    .font(.subheadline)
            Text("System: \(DM.getSystem())")
                    .font(.subheadline)
            Text("Version: \(DM.getOSVersion())")
                    .font(.subheadline)
                //Text("Battery Capacity: \(batteryCapacity) mAh")
                    //.font(.subheadline)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
