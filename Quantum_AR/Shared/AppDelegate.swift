
//
//  Quantum_ARApp.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 27/12/23.
//



import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import UIKit
import SwiftUI
import Foundation
import ARKit
import RealityKit
import USDZScanner


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        if  !ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth) {
            print("Doesn't Support AR")
        }
        // Uncomment this line if you want to use Local Emulator suite
      //  setupFirebaseLocalEmulator()
        return true
    }
    

    
}

