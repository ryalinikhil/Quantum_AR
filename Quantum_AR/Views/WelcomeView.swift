//
//  WelcomeView.swift
//  Quantum AR
//
//  Created by Sameer Nikhil on 26/12/23.
//

import SwiftUI
import ARKit
import RealityKit


struct WelcomeView: View {
    @State private var showUnlock = false
    @State private var didUnlock = false

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("ar_001f")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()

                VStack { 
                    
                    HStack{
                        
                    Spacer()
                        
                        
                        Image("introlg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                       // ShimmerTextView()
                            .padding(.top,60)

                    }
                    
                    Spacer()
                    if showUnlock {
                        SwipeView()
                            .onSwipeSuccess {
                                self.didUnlock = true
                                self.showUnlock = false
                            }
                            .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3, dampingFraction: 0.5)))
                    }
                }
                .padding(.bottom, 80)
                .padding(.horizontal)
                
                if didUnlock {
                    HomeView()
                   // InventoryListView()
                        .transition(AnyTransition.scale.animation(Animation.spring(response: 0.5, dampingFraction: 0.5)))
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            self.showUnlock = true
        }
        .statusBarHidden()
    }
        
}


#Preview {
    WelcomeView()
}



