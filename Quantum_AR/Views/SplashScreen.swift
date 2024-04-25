//
//  SplashScreen.swift
//  TestingProj
//
//  Created by Sameer Nikhil on 26/01/24.
//

import SwiftUI



import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
   
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
           // ContentView()
            WelcomeView()
                .previewInterfaceOrientation(.portrait)
        } else {
            VStack {
                ZStack{
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.29, green: 0.01, blue: 0.88), location: 0.0),
                            Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.7),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                    .ignoresSafeArea()
                VStack {
                  
                    
                    Image("spsc")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
 
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
        }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
