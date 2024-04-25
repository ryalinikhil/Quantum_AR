//
//  NetworkView.swift
//  TestRun
//
//  Created by Sameer Nikhil on 26/11/23.
//

import SwiftUI

import SwiftUI

struct NetworkView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            Color(.systemBlue).ignoresSafeArea()
            
            VStack {
                Image(systemName: networkManager.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                
                Text(networkManager.connectionDescription)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if !networkManager.isConnected {
                    Button {
                        print("Handle action..")
                    } label: {
                        Text("Retry")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: 140)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                }
            }
        }
    }
}




#Preview {
    NetworkView()
}
