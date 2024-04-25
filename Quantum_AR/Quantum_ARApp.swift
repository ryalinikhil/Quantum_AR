//
//  Quantum_ARApp.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 27/12/23.
//

import SwiftUI
import ARKit



@main
struct Quantum_ARApp: App {
  
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    static let captureController = RoomCaptureController()
    @State private var showInfo = false
    var body: some Scene {
        WindowGroup {
            NavigationStack {
               // WelcomeView()
                SplashScreen()
            }
            .environment(Quantum_ARApp.captureController)
        }
    }
}
