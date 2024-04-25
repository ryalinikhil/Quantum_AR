//
//  NetworkManager.swift
//  NetworkManagerSwiftUI
//
//  Created by Stephen Dowless on 8/27/21.
//

import SwiftUI
import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash" //arkit.badge.xmark
    }
    
    var connectionDescription: String {
        if isConnected {
            return "Internet connection looks good!"
            
            
        } else {
            return "Network Failure \nIt looks like you're not connected to the internet."
        }
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
}


