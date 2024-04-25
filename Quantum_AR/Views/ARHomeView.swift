//
//  ARHomeView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 04/01/24.
//

import SafariServices
import SwiftUI
import UniformTypeIdentifiers
import USDZScanner
import ARKit
import RealityKit
import ARKit

struct ARHomeView: View {
    @StateObject var vm = InventoryFormViewModel()
    @State private var isObjectCaptureActive = false
    @State private var isBottomSheetPresented = false
    @State private var isBottomSheetPresented2 = false
    @State private var isBottomSheetPresented3 = false
    @State private var isBottomSheetPresented4 = false
    @State private var isBottomSheetPresented5 = false
    @State private var isLidarAvailable = false
    @State private var isAlertPresented = false
    @State static var showInfo = false
    @EnvironmentObject private var captureController: RoomCaptureController
    var body: some View {
        
        ZStack{
            Color.black.opacity(0.07)
                .ignoresSafeArea()
            
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.0),
                    Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.23),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false)
            {
                VStack(alignment: .leading,spacing:12){
                    
                    
                    HStack{
                        HStack(alignment: .center, spacing: 2) {
                            
                            Button(action: {
                                
                                //vm.selectedUSDZSource = .objectCapture
                                checkLidarAvailability2()
                                
                                
                                
                            }) {
                                Image("fullscreen")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 28, height: 28)
                            }
                        }
                        .padding(9)
                        .background(Color(red: 0.98, green: 0.98, blue: 1))
                        .cornerRadius(12)
                        
                        Spacer()
                        
                        
                        Button(action: {
                            isBottomSheetPresented5.toggle()
                            // Add haptic feedback here
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                        }) {
                            HStack(alignment: .center, spacing: 2) {
                                ZStack{
                                    
                                    Image(systemName: "questionmark.circle")
                                        .foregroundColor(.black)
                                        .scaleEffect(1.3)
                                    //.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45, height: 45)
                                        .cornerRadius(10)
                                }
                            }
                            .background(Color(red: 0.98, green: 0.98, blue: 1))
                            .cornerRadius(12)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 104)
                            .frame(maxWidth: .infinity)
                            .background(
                                Image("welcome")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 104)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                            )
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 1)
                                    .stroke(Color(red: 0.52, green: 0.54, blue: 0.92).opacity(0.1), lineWidth: 2)
                            )
                        
                        
                        HStack(alignment: .top, spacing: 8) {
                            
                            VStack{
                                
                                HStack{
                                    HStack{
                                        Text("Quantum AR")
                                            .font(
                                                Font.custom("ethnocentric", size: 24)
                                                    .weight(.medium)
                                            )
                                            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 1))
                                            .frame(maxWidth: .infinity, minHeight: 21, maxHeight: 21, alignment: .topLeading)
                                        
                                        Spacer()
                                        //  .rotationEffect(Angle(degrees: -90))  Revolutionize reality
                                    }
                                    
                                    Spacer()
                                }
                                
                                
                                HStack{
                                    Text("Redefining Reality")
                                        .font(
                                            Font.custom("title3", size: 14)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color.white.opacity(0.5))
                                        .frame(maxWidth: .infinity, minHeight: 21, maxHeight: 21, alignment: .topLeading)
                                    
                                    Spacer()
                                    //  .rotationEffect(Angle(degrees: -90))  Revolutionize reality
                                }
                                .padding(.top,4)
                            }
                            
                            
                            
                        }
                        .padding(0)
                        .frame(width: 275, height:43, alignment: .topLeading)
                        
                        
                        
                    }
                    .frame(height: 104)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 5)
                    .cornerRadius(20)
                    
                    
                    
                    HStack{
                        Text("Discover")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                        
                            .padding(.horizontal)
                        
                        Spacer()
                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 20) {
                                
                                ZStack {
                                    VStack{
                                        Text("Object Capture")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                                            .frame(width: 140, alignment: .topLeading)
                                            .padding()
                                        
                                        Image("RC2")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                }
                                .frame(height: 225)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.23),
                                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(24)
                                
                                Button(action: {
                                    //vm.selectedUSDZSource = .objectCapture
                                    checkLidarAvailability2()
                                }) {
                                    
                                    HStack(alignment: .top, spacing: 10) {
                                        
                                        
                                        
                                        Text("Capture")
                                            .font(
                                                Font.custom("Inter", size: 12)
                                                    .weight(.medium)
                                            )
                                            .kerning(0.64)
                                            .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(alignment: .top)
                                    .frame(maxWidth: .infinity)
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
                                
                                
                            }
                            .padding(.horizontal,2)
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 10) {
                                
                                ZStack {
                                    VStack{
                                        Text("   Room Plan")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                                            .frame(width: 140, alignment: .topLeading)
                                            .padding(2)
                                        
                                        Image("roomp")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                }
                                .frame(height: 225)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.23),
                                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(24)
                                
                                NavigationLink(
                                    destination: ContentView55(),
                                    isActive: $isObjectCaptureActive
                                ) {
                                    EmptyView()
                                }
                                .hidden()
                                
                                Button(action: {
                                    // vm.selectedUSDZSource = .objectCapture
                                    isObjectCaptureActive = true
                                    // Add haptic feedback here
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                                }) {
                                    
                                    HStack(alignment: .top, spacing: 10) {
                                        
                                        Text("Capture")
                                            .font(
                                                Font.custom("Inter", size: 12)
                                                    .weight(.medium)
                                            )
                                            .kerning(0.64)
                                            .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(alignment: .top)
                                    .frame(maxWidth: .infinity)
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
                            }
                            .padding(.horizontal,2)
                            
                        }
                        .padding(.horizontal,5)
                        
                        //2ND ROW
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 20) {
                                
                                ZStack {
                                    VStack{
                                        Text("Room Scan")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                                            .frame(width: 140, alignment: .topLeading)
                                            .padding()
                                        
                                        Image("final")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                }
                                .frame(height: 225)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.23),
                                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(24)
                                
                                Button(action: {
                                    //isBottomSheetPresented3.toggle()
                                    checkLidarAvailability3()
                                    // Add haptic feedback here
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                                }) {
                                    
                                    HStack(alignment: .top, spacing: 10) {
                                        
                                        Text("Capture")
                                            .font(
                                                Font.custom("Inter", size: 12)
                                                    .weight(.medium)
                                            )
                                            .kerning(0.64)
                                            .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(alignment: .top)
                                    .frame(maxWidth: .infinity)
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
                                
                                
                            }
                            .padding(.horizontal,2)
                            
                            Spacer()
                            
                            
                            VStack(alignment: .center, spacing: 10) {
                                
                                ZStack {
                                    VStack{
                                        Text("LiDAR Check")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                                            .frame(width: 140, alignment: .topLeading)
                                            .padding()
                                        
                                        Image("lidar2")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                }
                                .frame(height: 225)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.23),
                                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(24)
                                
                                /* NavigationLink(
                                 destination: RoomScanView()//,
                                 //  isActive: $isObjectCaptureActive
                                 ) {
                                 EmptyView()
                                 }
                                 .hidden()*/
                                
                                Button(action: {
                                    // vm.selectedUSDZSource = .objectCapture
                                    isBottomSheetPresented4.toggle()
                                    // Add haptic feedback here
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                                }) {
                                    
                                    HStack(alignment: .top, spacing: 10) {
                                        
                                        Text("Details")
                                            .font(
                                                Font.custom("Inter", size: 12)
                                                    .weight(.medium)
                                            )
                                            .kerning(0.64)
                                            .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(alignment: .top)
                                    .frame(maxWidth: .infinity)
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
                            }
                            .padding(.horizontal,2)
                            
                        }
                        .padding(.horizontal,5)
                        .padding(.top,2.5)
                        
                        
                        
                        //3RD ROW
                        
                        HStack{
                            Text("Explore")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                            
                                .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 20) {
                                
                                ZStack {
                                    VStack{
                                        Text("View on Vision Pro")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                                            .frame(width: 140, alignment: .topLeading)
                                            .padding()
                                        
                                        Image("Visionp")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                }
                                .frame(height: 225)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.23),
                                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(24)
                                
                                Button(action: {
                                    // vm.selectedUSDZSource = .objectCapture
                                    isBottomSheetPresented.toggle()
                                    // Add haptic feedback here
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                                }) {
                                    
                                    HStack(alignment: .top, spacing: 10) {
                                        
                                        Text("Share")
                                            .font(
                                                Font.custom("Inter", size: 12)
                                                    .weight(.medium)
                                            )
                                            .kerning(0.64)
                                            .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(alignment: .top)
                                    .frame(maxWidth: .infinity)
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
                                
                                
                            }
                            .padding(.horizontal,2)
                            
                            Spacer()
                            
                            
                            VStack(alignment: .center, spacing: 10) {
                                
                                ZStack {
                                    VStack{
                                        Text("Supported Devices")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                                            .frame(width: 140, alignment: .topLeading)
                                            .padding()
                                        
                                        Image("iphone")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                }
                                .frame(height: 225)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.23),
                                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                                        ],
                                        startPoint: UnitPoint(x: 0.5, y: 0),
                                        endPoint: UnitPoint(x: 0.5, y: 1)
                                    )
                                )
                                .cornerRadius(24)
                                
                                NavigationLink(
                                    destination: ContentView55(),
                                    isActive: $isObjectCaptureActive
                                ) {
                                    EmptyView()
                                }
                                .hidden()
                                
                                Button(action: {
                                    // vm.selectedUSDZSource = .objectCapture
                                    isBottomSheetPresented2.toggle()
                                    // Add haptic feedback here
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                                }) {
                                    
                                    HStack(alignment: .top, spacing: 10) {
                                        
                                        Text("Details")
                                            .font(
                                                Font.custom("Inter", size: 12)
                                                    .weight(.medium)
                                            )
                                            .kerning(0.64)
                                            .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .frame(alignment: .top)
                                    .frame(maxWidth: .infinity)
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
                            }
                            .padding(.horizontal,2)
                            
                        }
                        .padding(.horizontal,5)
                        
                        
                    }
                    
                    .sheet(isPresented: .init(get: {
                        vm.selectedUSDZSource == .objectCapture
                    }, set: { _ in
                        vm.selectedUSDZSource = nil
                    }), content: {
                        USDZScanner { url in
                            Task { await vm.uploadUSDZ(fileURL: url) }
                            vm.selectedUSDZSource = nil
                        }
                    })
                    .sheet(isPresented: $isBottomSheetPresented) {
                        BottomSheetView(isPresented: $isBottomSheetPresented)
                    }
                    .sheet(isPresented: $isBottomSheetPresented2) {
                        Supported(isPresented: $isBottomSheetPresented2)
                    }
                    .sheet(isPresented: $isBottomSheetPresented3) {
                        RoomScanView(isPresented: $isBottomSheetPresented3)
                    }
                    .sheet(isPresented: $isBottomSheetPresented4) {
                        lidarcheck(isPresented: $isBottomSheetPresented4)
                    }
                    .sheet(isPresented: $isBottomSheetPresented5) {
                        HelpPageView(showInfo: ARHomeView.$showInfo, isPresented: $isBottomSheetPresented5)
                        //HelpPageView(showInfo: $showInfo)
                    }
                    .alert(isPresented: $isAlertPresented) {
                        Alert(
                            title: Text(isLidarAvailable ? "LIDAR Available" : "LIDAR Not Available"),
                            message: Text(isLidarAvailable ? "Your device has a LIDAR sensor." : "Your device does not have a LIDAR sensor."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    .fileImporter(isPresented: .init(get: { vm.selectedUSDZSource == .fileImporter }, set: { _ in
                        vm.selectedUSDZSource = nil
                    }), allowedContentTypes: [UTType.usdz], onCompletion: { result in
                        switch result {
                        case .success(let url):
                            Task { await vm.uploadUSDZ(fileURL: url, isSecurityScopedResource: true) }
                        case .failure(let failure):
                            vm.error = failure.localizedDescription
                        }
                    })
                    .alert(isPresented: .init(get: { vm.error != nil}, set: { _ in vm.error = nil }), error: "An error has occured", actions: { _ in
                    }, message: { _ in
                        Text(vm.error ?? "")
                    })
                    
                    Image("jsn")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
            }
        }
    }
    
    func checkLidarAvailability2() {
        let configuration = ARWorldTrackingConfiguration()
        
        if ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth) {
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
                isLidarAvailable = true
                vm.selectedUSDZSource = .objectCapture
            } else {
                isLidarAvailable = false
                isAlertPresented = true
            }
        } else {
            isLidarAvailable = false
            isAlertPresented = true
        }
        
        // Do not show the pop-up
        isAlertPresented = false
    }

    func checkLidarAvailability3() {
        let configuration = ARWorldTrackingConfiguration()
        
        if ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth) {
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
                isLidarAvailable = true
                isBottomSheetPresented3.toggle()
            } else {
                isLidarAvailable = false
                isAlertPresented = true
            }
        } else {
            isLidarAvailable = false
            isAlertPresented = true
        }
        
        // Do not show the pop-up
        isAlertPresented = false
    }
    
}

#Preview {
    ARHomeView()
}
