//
//  HomeView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 29/12/23.
//

import SwiftUI
import UIKit
import ARKit
import RealityKit


struct HomeView: View {
    @State private var tabSelected: Tab = .person
    @ObservedObject var networkManager = NetworkManager()
    @State private var showIntro = true
    @State private var isWelcomeScreenPresented = false

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            if networkManager.isConnected {
                ZStack {
                    VStack {
                        TabView(selection: $tabSelected) {
                            ForEach(Tab.allCases, id: \.rawValue) { tab in
                                tabContent(for: tab)
                                    .tag(tab)
                                
                            }
                            
                        }
                    }
                    VStack {
                        Spacer()
                        CustomTabBar(selectedTab: $tabSelected)
                    }
                }
                .statusBarHidden()
            } else {
                // Display a message or UI when there is no internet connection
                VStack {
                    Image(systemName: networkManager.imageName)
                        .font(.system(size: 70))
                        .foregroundColor(.red)
                        .symbolEffect(.pulse, options: .repeating, isActive: true)
                    
                    
                    
                    Text(networkManager.connectionDescription)
                        .padding()
                        .multilineTextAlignment(.center)
                        .lineLimit(nil) // Allow unlimited lines
                        .fixedSize(horizontal: false, vertical: true) // Allow vertical expansion
                        .font(.system(size: 15, weight: .bold)) // Make the first line bold
                    
                }
            }
        }
           /* .sheet(isPresented: $isWelcomeScreenPresented, onDismiss: {
                // This closure will be executed when the welcome screen is dismissed
                UserDefaults.standard.set(true, forKey: "hasShownWelcomeScreen")
            }) {
                IntroView(isPresented: $isWelcomeScreenPresented)
            }
            .onAppear {
                // Check if the welcome screen has been shown before
                if !UserDefaults.standard.bool(forKey: "hasShownWelcomeScreen") {
                    isWelcomeScreenPresented = true
                }
            }*/
    }
 

    
    private func tabContent(for tab: Tab) -> some View {
        switch tab {
        case .person:
           // return AnyView(InventoryFormView()) 
            return AnyView( ARHomeView())
           
            
        case .gearshape:
            return AnyView(GearShapeView())
            
        }
    }
}

enum Tab: String, CaseIterable {
    case person = "arkit"
    case gearshape = "gear"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    private var tabColor: Color {
        switch selectedTab {
        case .person:
            return .indigo
        case .gearshape:
            return .indigo
        }
    }

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                Image(systemName: tab.rawValue)
                    .foregroundColor(tab == selectedTab ? tabColor : .white)
                    .font(.system(size: 27))    // 25 - initial
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedTab = tab
                            
                            // Add haptic feedback here
                           UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                                                 
                        }
                    }
                    // .symbolEffect(.pulse , options: .nonRepeating, isActive: true)
                Spacer()
            }
       //     .symbolEffect(.bounce.up.wholeSymbol)

        }
        .frame(width: 260, height: 65)  // 60 x 240 - initial
        .background(.thinMaterial)
        .cornerRadius(28)
        .padding(.bottom, 0)
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .inset(by: 0.5)
                .stroke(.white.opacity(0.7), lineWidth: 1)
        )
        .padding(.bottom,30)
    }
}



struct HomeView890: View {
    var body: some View {
        Text("Home View")
            .padding()
    }
}

struct MessageView: View {
    var body: some View {
        Text("Message View")
            .padding()
    }
}



struct LeafView: View {
    var body: some View {
        Text("Leaf View")
            
    }
}
