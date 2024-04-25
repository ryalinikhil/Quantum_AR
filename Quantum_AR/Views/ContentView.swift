//
//  ContentView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 27/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("ar_001f")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ZStack{
                                
                Content2View()
                Text("Hello, Ethnocentric Font!")
        .font(Font.custom("ethnocentric", size: 20))
                        
                
                    .foregroundStyle(.white)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
