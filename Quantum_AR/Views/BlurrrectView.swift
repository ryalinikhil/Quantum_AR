//
//  BlurrrectView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 28/12/23.
//

import SwiftUI
import ARKit
import RealityKit


struct Content2View: View {
  var body: some View {
      ZStack {

          Color.black.opacity(0.88)
      }
      .frame(width: 429, height: 340)
      .background(.black.opacity(0.2))
      .cornerRadius(50)
      .shadow(color: Color(red: 0.16, green: 0.15, blue: 0.51).opacity(0.1), radius: 15, x: 0, y: -5)
      .overlay(
        RoundedRectangle(cornerRadius: 50)
          .inset(by: -0.5)
          .stroke(.white, lineWidth: 1)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 50)
          .inset(by: -0.5)
          .stroke(.white, lineWidth: 1)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 50)
          .inset(by: -0.5)
          .stroke(.white, lineWidth: 1)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 50)
          .inset(by: -0.5)
          .stroke(.white, lineWidth: 1)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 50)
          .inset(by: -0.5)
          .stroke(.white, lineWidth: 1)
      )
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ShimmerTextView()
  }
}

import SwiftUI

struct Content3View: View {
    @State private var rotation: Double = 0

    var body: some View {
        VStack {
            Image(systemName: "arkit")
                .font(.system(size: 60))
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 0).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotation = 360 // Initial rotation angle
                }
        }
    }
}




struct ShimmerTextView: View {
    var body: some View {
  
        Home()
    }
}

struct Home: View {
    
    // Toggle For MultiColors...
    @State var multiColor = false
    
    var body: some View{
        
        VStack(spacing: 25){
            
            TextShimmer(text: "AR", multiColors: $multiColor)
                
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}


struct Home2: View {
    
    // Toggle For MultiColors...
    @State var multiColor = false
    
    var body: some View{
        
        VStack(spacing: 25){
            
            TextShimmer(text: "Available Soon", multiColors: $multiColor)
                
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

// TextShimmer....

struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(Font.custom("ethnocentric", size: 40))
                .foregroundColor(Color.black.opacity(0.25))
            
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(Font.custom("ethnocentric", size: 40))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }
            // Masking For Shimmer Effect...
            .mask(
            
                Rectangle()
                    // For Some More Nice Effect Were Going to use Gradient...
                    .fill(
                    
                        // You can use any Color Here...
                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.8),Color.black,Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                // Moving View Continously...
                // so it will create Shimmer Effect...
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
            
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
        }
    }
    
    // Random Color....
    
    // It's Your Wish yOu can change anything here...
    // or you can also use Array of colors to pick random One....
    
    func randomColor()->Color{
        
        let color = Color(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1))
        
        return Color(color)
    }
}

struct TextShimmer2: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View{
        
        ZStack{
            
            Text(text)
                .foregroundColor(Color.black.opacity(0.25))
            
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }
            // Masking For Shimmer Effect...
            .mask(
            
                Rectangle()
                    // For Some More Nice Effect Were Going to use Gradient...
                    .fill(
                    
                        // You can use any Color Here...
                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.8),Color.black,Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                // Moving View Continously...
                // so it will create Shimmer Effect...
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
            
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
        }
    }
    
    // Random Color....
    
    // It's Your Wish yOu can change anything here...
    // or you can also use Array of colors to pick random One....
    
    func randomColor()->Color{
        
        let color = Color(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1))
        
        return Color(color)
    }
}
