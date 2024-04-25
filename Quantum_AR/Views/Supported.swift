//
//  Supported.swift
//  TestingProj
//
//  Created by Sameer Nikhil on 20/01/24.
//

import SwiftUI

struct Supported: View {
    @Binding var isPresented: Bool
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
                VStack{
                    HStack{
                        
                        
                        Text("Supported Devices")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                            .frame(width: 170, alignment: .topLeading)
                            .padding()
                        
                        
                        
                        Spacer()
                        Button(action: {
                               isPresented = false
                            // Add haptic feedback here
                           UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                            // Haptic intensity:    .heavy    .medium   .light  .rigid  .soft
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.white)
                                .scaleEffect(1.5)
                        })
                        .padding(.horizontal)
                    }
                    
                    Image("sd")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text("At this time, it is limited to the LIDAR, which includes iPhones and iPads. However, we plan to support all devices in the future.")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .topLeading)
                        .padding()
                    
                    HStack{  
                        Text("iPhones")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white.opacity(0.8))
                            .frame(alignment: .topLeading)
                           Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing:2){
                        
                        HStack{
                            Text("iPhone 15 Pro Max")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 15 Pro")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 14 Pro Max")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 14 Pro")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 13 Pro Max")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 13 Pro")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 12 Pro Max")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        HStack{
                            Text("iPhone 12 Pro")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .topLeading)
                               Spacer()
                        }
                        
                        }
                    .padding()
                    
                    
                    
                   
                    Spacer()
                }
            }
        }
    }
}
/*
#Preview {
    Supported()
}
*/
