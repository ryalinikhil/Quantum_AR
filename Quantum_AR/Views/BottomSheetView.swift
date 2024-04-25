//
//  BottomSheetView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 20/01/24.
//
import SwiftUI

struct BottomSheetView: View {
    @Binding var isPresented: Bool
    @State var multiColor = false
    var body: some View {
        
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
            
            VStack(alignment: .leading) {
                
                HStack{
                    
                    Text("View your Captures")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.945, green: 0.93, blue: 1))
                        .frame(width: 140, alignment: .topLeading)
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
                
                
                HStack{
                    Spacer()
                    
                    Image("safe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                       // .frame(width: 450)
                        
                    Spacer()
                }
                .padding()
                
                Text("Unleash the power of Quantum AR Capture and share AR wonders effortlessly. Seamlessly integrate with Apple VisionOS. \nComing soon – a new era of shared augmented reality experiences.")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                    .frame(alignment: .topLeading)
                    .padding()
                
                HStack{
                    Spacer()
                    Image(systemName: "visionpro")
                        .scaleEffect(1.5)
                    Spacer()
                }.padding()
                
                HStack{
                    Spacer()
                    Text("Available Soon..")
                        .foregroundStyle(.white)
                    Spacer()
                }.padding()

                
                Spacer()
            }
        }
        .statusBarHidden()
    }
}




        
      
