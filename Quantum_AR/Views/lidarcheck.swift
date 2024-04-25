//
//  lidarcheck.swift
//  TestingProj
//
//  Created by Sameer Nikhil on 23/01/24.
//

import SwiftUI
import ARKit

struct lidarcheck: View {
    @State private var isLidarAvailable = false
    @State private var isAlertPresented = false
    @Binding var isPresented: Bool
    var body: some View {
        ZStack
        {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.0),
                    Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.7),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        
                        Text("LiDAR Check")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                            .frame(width: 170, alignment: .topLeading)
                            .padding()
                        
                        
                        
                        Spacer()
                        Button(action: {
                               isPresented = false
                            // Add haptic feedback here
                           UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                            // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.white)
                                .scaleEffect(1.5)
                        })
                        .padding(.horizontal)
                    }
                    
                    Text("Check if your iPhone is equipped with a LiDAR sensor.")
                        .foregroundStyle(.gray)
                    
                    Image("lidar2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Button(action: {
                        checkLidarAvailability()
                        // Add haptic feedback here
                       UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                        // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                    }) {
                        
                        HStack(alignment: .top, spacing: 10) {
                                                        
                            Text("Check")
                                .font(
                                    Font.custom("Inter", size: 12)
                                        .weight(.medium)
                                )
                                .kerning(0.64)
                                .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 16)
                        .frame(width: 185, alignment: .top)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white.opacity(0.1), location: 0.00),
                                    Gradient.Stop(color: .white.opacity(0.07), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.01, y: 0.54),
                                endPoint: UnitPoint(x: 1, y: 0.62)
                            )
                        )
                        .cornerRadius(14)
                    }
                    .padding()
                    
                    HStack{
                        
                        Text("What is LiDAR ?")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                            .frame(width: 290, alignment: .topLeading)
                            .padding()
                        
                        Spacer()
                        
                    }
                    
                    Text("LiDAR, which stands for Light Detection and Ranging, is a remote sensing technology that uses laser light to measure distances and create precise, three-dimensional maps or models of objects and environments.")
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                    
                    
                    
                    
                    
                }
                .alert(isPresented: $isAlertPresented) {
                    Alert(
                        title: Text(isLidarAvailable ? "LIDAR Available" : "LIDAR Not Available"),
                        message: Text(isLidarAvailable ? "Your device has a LIDAR sensor." : "Your device does not have a LIDAR sensor."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
    func checkLidarAvailability() {
        let configuration = ARWorldTrackingConfiguration()
        
        
        
      //  if ARWorldTrackingConfiguration.isSupported {
        if !ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth) {
            isLidarAvailable = false
        } else {
           
            isLidarAvailable = true
        }
        
        isAlertPresented = true
    }
}
/*
#Preview {
    lidarcheck()
}*/
