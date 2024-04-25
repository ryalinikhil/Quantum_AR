//
//  GearShapeView.swift
//  TestRun
//
//  Created by Sameer Nikhil on 25/11/23.
//


import SwiftUI
import ARKit


/*struct GearShapeView: View {
    @State private var isShowingPopup = false
    @AppStorage("isDarkMode") private var isDarkMode = true
    @State private var isHapticFeedbackEnabled = true // Add this state
        
    var body: some View {
        
                NavigationView {
                    ZStack{
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.0),
                        Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.15), location: 0.7),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
                .ignoresSafeArea()
                    
                List {
                    Section(header: Text("")) {
                        HStack {
                            Image("icon")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(10)
                            Text("  Quantum AR")
                                .font(Font.custom("title3", size: 15))
                            
                            Spacer()
                            
                            
                        }
                        
                    }
                    
                    Section(header: Text("Actions")
                        .font(Font.custom("ethnocentric", size: 8))) {
                            
                            
                            HStack {
                                Toggle("Dark Mode", isOn: $isDarkMode)
                                    .foregroundColor(.blue)
                                    .font(Font.custom("ethnocentrichh", size: 15))
                                
                            }
                            
                            HStack {
                                Toggle("Haptic Feedback", isOn: $isHapticFeedbackEnabled)
                                    .font(Font.custom("ethnocentrichh", size: 15))
                                    .foregroundColor(.blue)
                            }
                        }
                    
                    
                    Section(header: Text("General")
                        .font(Font.custom("ethnocentric", size: 8))) {
                            
                            Link("Terms of Use (EULA)", destination: URL(string: "https://www.eulatemplate.com/live.php?token=UocgEPccdj2uLRpzCkoz5EJGQX6fXjTk")!)
                                .font(Font.custom("ethnocentrichh", size: 15))
                                .foregroundColor(.blue)
                            
                            
                            
                            Link("Privacy Policy", destination: URL(string: "https://www.privacypolicyonline.com/live.php?token=MJjpx65YwPdyAXbJP1V8oaBoT6G8Xgxz")!)
                                .font(Font.custom("ethnocentrichh", size: 15))
                                .foregroundColor(.blue)
                            
                            
                            
                            
                            Button(action: {
                                let emailAddress = "adrenoxshark@gmail.com"
                                if let emailURL = URL(string: "mailto:\(emailAddress)") {
                                    UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
                                }
                            }) {
                                Text("Contact Support")
                                    .font(Font.custom("ethnocentrichh", size: 15))
                                    .foregroundColor(.blue)
                                    .cornerRadius(10)
                            }
                            
                            
                        }
                    
                    Section(header: Text("Additional Information")
                        .font(Font.custom("ethnocentric", size: 7))) {
                            
                            Link("Our Apps", destination: URL(string: "https://apps.apple.com/in/app/weather-by-wallspectra/id6463508279")!)
                                .font(Font.custom("ethnocentrichh", size: 15))
                                .foregroundColor(.blue)
                            
                            
                            Link("Visit Our Website", destination: URL(string: "https://wallspectra.wixsite.com/home")!)
                                .font(Font.custom("ethnocentrichh", size: 15))
                                .foregroundColor(.blue)
                            
                            
                            
                            
                            Link("Rate App", destination: URL(string: "https://apps.apple.com/in/app/wallspectra/id6450430031")!)
                                .font(Font.custom("ethnocentrichh", size: 15))
                                .foregroundColor(.blue)
                            
                            // Replace here with your App link
                            
                        }
                }
                }
                
                .listStyle(InsetGroupedListStyle())
                .background(LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.0),
                        Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.15), location: 0.7),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                ))
                .navigationBarTitle("Settings")
                .font(Font.custom("ethnocentrichh", size: 9))
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .cornerRadius(20)
                .onChange(of: isHapticFeedbackEnabled) { newValue in
                    // Perform haptic feedback when the toggle value changes
                    if newValue {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                }
            }
        
    }
}*/
    

struct GearShapeView: View {
    @State private var isShowingPopup = false
    @State private var isHapticFeedbackEnabled = true // Add this state
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var isAlertPresented = false
    @State private var isCameraEnabled = false

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
                VStack(alignment: .leading){
                    
                    
                    HStack{
                        Text("Settings")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            
                            
                            .padding()
                        
                    }
                    
       ///
                    HStack{
                        Spacer()
                        
                        Image("iconw")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        
                        Spacer()
                    }
                    .padding()
           ///
                
                    
            
                    
                    HStack{
                        Text("General")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                    .padding(.top,8)
                    
                   //  Terms of Use
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                                   // Open your link here
                                   if let url = URL(string: "https://www.eulatemplate.com/live.php?token=2ES0BKgZy1PpvfkNlg9OXd9HotWtMjwf") {
                                       UIApplication.shared.open(url)
                                   }
                            // Add haptic feedback here
                           UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                            
                        }) {
                            
                            HStack(alignment: .top, spacing: 10) {
                                
                                Text("Terms of Use (EULA)")
                                    .font(
                                        Font.custom("Inter", size: 12)
                                            .weight(.medium)
                                    )
                                    .kerning(0.64)
                                    .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                
                                Spacer()
                                
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity, alignment: .top)
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
                            
                            Spacer()
                        }
                        
                    }
                    //
                    
                    
                    // Privacy Policy
                     HStack{
                         
                         Spacer()
                         
                         Button(action: {
                                    // Open your link here
                                    if let url = URL(string: "https://www.privacypolicyonline.com/live.php?token=Ep038SzFtAsAZ66Hwq7vobMKU9zMNeO4") {
                                        UIApplication.shared.open(url)
                                    }
                         }) {
                             
                             HStack(alignment: .top, spacing: 10) {
                                 
                                 Text("Privacy Policy")
                                     .font(
                                         Font.custom("Inter", size: 12)
                                             .weight(.medium)
                                     )
                                     .kerning(0.64)
                                     .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                 
                                 Spacer()
                                 
                             }
                             .padding(.horizontal)
                             .padding(.vertical, 16)
                             .frame(maxWidth: .infinity, alignment: .top)
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
                             
                             Spacer()
                         }
                         
                     }
                     //
                    
                    
                    // Contact Support
                     HStack{
                         
                         Spacer()
                         
                         Button(action: {
                             let emailAddress = "adrenoxshark@gmail.com"
                             if let emailURL = URL(string: "mailto:\(emailAddress)") {
                                 UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
                             }
                         }) {
                             
                             HStack(alignment: .top, spacing: 10) {
                                 
                                 Text("Contact Support")
                                     .font(
                                         Font.custom("Inter", size: 12)
                                             .weight(.medium)
                                     )
                                     .kerning(0.64)
                                     .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                 
                                 Spacer()
                                 
                             }
                             .padding(.horizontal)
                             .padding(.vertical, 16)
                             .frame(maxWidth: .infinity, alignment: .top)
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
                             
                             Spacer()
                         }
                         
                     }
                     //
                    
                           
                    HStack{
                        Text("Additional Information")
                            .foregroundStyle(.gray.opacity(0.7))
                    }
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    
                    // Our Apps
                     HStack{
                         
                         Spacer()
                         
                         Button(action: {
                                    // Open your link here
                                    if let url = URL(string: "https://apps.apple.com/in/developer/ryali-sri-ranga-sameer-nikhil/id1692996175") {
                                        UIApplication.shared.open(url)
                                    }
                         }) {
                             
                             HStack(alignment: .top, spacing: 10) {
                                 
                                 Text("Our Apps")
                                     .font(
                                         Font.custom("Inter", size: 12)
                                             .weight(.medium)
                                     )
                                     .kerning(0.64)
                                     .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                 
                                 Spacer()
                                 
                             }
                             .padding(.horizontal)
                             .padding(.vertical, 16)
                             .frame(maxWidth: .infinity, alignment: .top)
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
                             
                             Spacer()
                         }
                         
                     }
                     //
                    
                    // Visit Our Website
                     HStack{
                         
                         Spacer()
                         
                         Button(action: {
                                    // Open your link here
                                    if let url = URL(string: "https://wallspectra.wixsite.com/home") {
                                        UIApplication.shared.open(url)
                                    }
                         }) {
                             
                             HStack(alignment: .top, spacing: 10) {
                                 
                                 Text("Visit Our Website")
                                     .font(
                                         Font.custom("Inter", size: 12)
                                             .weight(.medium)
                                     )
                                     .kerning(0.64)
                                     .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                 
                                 Spacer()
                                 
                             }
                             .padding(.horizontal)
                             .padding(.vertical, 16)
                             .frame(maxWidth: .infinity, alignment: .top)
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
                             
                             Spacer()
                         }
                         
                     }
                     //
                    
                    
                    // Rate App
                     HStack{
                         
                         Spacer()
                         
                         Button(action: {
                                    // Open your link here
                                    if let url = URL(string: "https://apps.apple.com/in/app/wallspectra/id6450430031") {
                                        UIApplication.shared.open(url)
                                    }
                         }) {
                             
                             HStack(alignment: .top, spacing: 10) {
                                 
                                 Text("Rate App")
                                     .font(
                                         Font.custom("Inter", size: 12)
                                             .weight(.medium)
                                     )
                                     .kerning(0.64)
                                     .foregroundColor(Color(red: 0.96, green: 0.97, blue: 1))
                                 
                                 Spacer()
                                 
                             }
                             .padding(.horizontal)
                             .padding(.vertical, 16)
                             .frame(maxWidth: .infinity, alignment: .top)
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
                             
                             Spacer()
                         }
                         
                     }
                     //
                    

                }
            }
        }
        .statusBarHidden()
    }
    
    private func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                print("Camera access granted")
                // You can perform additional actions if camera access is granted
            } else {
                print("Camera access denied")
                // You can handle the case where camera access is denied
            }
        }
    }
}
    



#Preview {
    LIDARTEST()
}





#Preview {
    GearShapeView()
}
