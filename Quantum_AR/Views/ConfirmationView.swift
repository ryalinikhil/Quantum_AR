//
//  ConfirmationView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 29/12/23.
//

import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 421, height: 384.65076)
                  .background(
                    Image("PATH_TO_IMAGE")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 421, height: 384.6507568359375)
                      .clipped()
                  )
            }
            .frame(width: 600, height: 600)
            .background(
              LinearGradient(
                stops: [
                  Gradient.Stop(color: Color(red: 0.45, green: 0.31, blue: 0.74), location: 0.23),
                  Gradient.Stop(color: Color(red: 0.09, green: 0.08, blue: 0.12), location: 0.82),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
              )
            )
            .cornerRadius(54)
            
            
        }
        .padding(54)
        .background(Color(red: 0.05, green: 0.05, blue: 0.08))
        .cornerRadius(64)
        .overlay(
          RoundedRectangle(cornerRadius: 64)
            .inset(by: 2)
            .stroke(Color(red: 0.44, green: 0.44, blue: 0.44).opacity(0.33), style: StrokeStyle(lineWidth: 4, dash: [8, 8]))
        )
    }
}


#Preview {
    ConfirmationView()
}

