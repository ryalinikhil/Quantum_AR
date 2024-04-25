//
//  LIDARTEST.swift
//  TestingProj
//
//  Created by Sameer Nikhil on 23/01/24.
//


import SwiftUI
import ARKit


struct LIDARTEST: View {

        @State private var isLidarAvailable = false
        @State private var isAlertPresented = false
        
        var body: some View {
            VStack {
                Button("Check LIDAR") {
                    checkLidarAvailability()
                    // Add haptic feedback here
                   UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                }
                .padding()
                
                Spacer()
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(
                    title: Text(isLidarAvailable ? "LIDAR Available" : "LIDAR Not Available"),
                    message: Text(isLidarAvailable ? "Your device has a LIDAR sensor." : "Your device does not have a LIDAR sensor."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        
        func checkLidarAvailability() {
            let configuration = ARWorldTrackingConfiguration()
            
            if ARWorldTrackingConfiguration.isSupported {
                isLidarAvailable = true
            } else {
                isLidarAvailable = false
            }
            
            isAlertPresented = true
        }
    }



#Preview {
    LIDARTEST()
}

