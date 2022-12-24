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
            Group
            {
                HStack
                {
                    Text("Model Description:").font(.headline)
                    Text(DM.modelDescription).font(.body)
                }
                
                HStack
                {
                    Text("Serial Number:").font(.headline)
                    Text(DM.serialNumber).font(.body)
                }
                
                HStack
                {
                    Text("Model:").font(.headline)
                    Text(DM.model).font(.body)
                }
                
                HStack
                {
                    Text("Model Year:").font(.headline)
                    Text("N/A").font(.body)
                }
                
                HStack
                {
                    Text("Model Identifier:").font(.headline)
                    Text(DM.modelIdentifier).font(.body)
                }
                
//                HStack
//                {
//                    Text("Part Number:").font(.headline)
//                    Text("N/A").font(.body)
//                }
//
//                HStack
//                {
//                    Text("Model Number:").font(.headline)
//                    Text("N/A").font(.body)
//                }
                
//                HStack
//                {
//                    Text("Release Year:").font(.headline)
//                    Text(DM.releaseYear).font(.body)
//                }
                
                HStack
                {
                    Text("MacOS Version:").font(.headline)
                    Text(DM.macOSVersion).font(.body)
                }
                
//                HStack
//                {
//                    Text("Display Size:").font(.headline)
//                    Text(DM.displaySize).font(.body)
//                }
                
                
                
            }
            
            Group
            {
                HStack
                {
                    Text("Ram Capacity:").font(.headline)
                    Text(DM.ramCapacity).font(.body)
                }
                
                HStack
                {
                    Text("Processor:").font(.headline)
                    Text(DM.processor).font(.body)
                }
                
    
                HStack
                {
                    Text("Storage Capacity:").font(.headline)
                    Text(DM.storageCapacity).font(.body)
                }
//
//                HStack
//                {
//                    Text("Color:").font(.headline)
//                    Text("N/A").font(.body)
//                }
//
//                HStack
//                {
//                    Text("Model Dimensions:").font(.headline)
//                    Text("N/A").font(.body)
//                }
//
//                HStack
//                {
//                    Text("Model Average Weight:").font(.headline)
//                    Text("N/A").font(.body)
//                }
    
                HStack
                {
                    Text("Bluetooth:").font(.headline)
                    Text("N/A").font(.body)
                }
                //
                //            HStack
                //            {
                //                Text("BridgeOS Version:").font(.headline)
                //                Text(DM.getBridgeOS()).font(.body)
                //            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
