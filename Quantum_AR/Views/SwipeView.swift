//
//  SwipeView.swift
//  Quantum AR
//
//  Created by Sameer Nikhil on 26/12/23.
//

import SwiftUI

struct SwipeView: View {
    
    // we want to animate the thumb size when user starts dragging (swipe)
    @State private var thumbSize:CGSize = CGSize.inactiveThumbSize
    // we need to keep track of the dragging value. Initially its zero
    @State private var dragOffset:CGSize = .zero
    // Lets also keep track of when enough was swiped
    @State private var isEnough = false
    // Actions
    private var actionSuccess: (() -> Void )?
    // The track does not change size
    let trackSize = CGSize.trackSize
    
    var body: some View {
        ZStack{
            
            Content2View()
            
            VStack(alignment: .center, spacing: 27.02778) {
                
                HStack{
                    Text("Quantum AR")

                        .font(Font.custom("ethnocentric", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 290, height: 20, alignment: .top)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                Text("By continuing you acknowledge and accept our Terms and Conditions. Please review them before proceeding.")
                    .font(Font.custom("ethnocentric", size: 7.71204))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.96).opacity(0.6))
                    .frame(width: 252.25926, alignment: .top)
                
                ZStack {
                    // Swipe Track
                    Capsule()
                        .frame(width: trackSize.width, height: trackSize.height)
                        .foregroundColor(Color.black).blendMode(.overlay).opacity(0.5)
                    
                    // Help text
                    HStack(alignment: .center, spacing: 11.18017) {
                        Text("Get started")
                            .font(
                                Font.custom("ethnocentric", size: 14.31574)
                                    .weight(.semibold)
                            )
                            .offset(x: 30, y: 0)
                            .opacity(Double(1 - ( (self.dragOffset.width*2)/self.trackSize.width )))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 175.31852, height: 19.82037, alignment: .top)
                    }
                    .padding(.leading, 17.88826)
                    .padding(.trailing, 19.00628)
                    .padding(.top, 13.4162)
                    .padding(.bottom, 12.29818)
                    .frame(width: trackSize.width, height: trackSize.height)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.43))
                    
                    .cornerRadius(33.5405)
                    .overlay(
                        RoundedRectangle(cornerRadius: 33.5405)
                            .inset(by: 0.56)
                            .stroke(.white.opacity(0.5), lineWidth: 1.11802)
                    )
                    // Thumb
                    ZStack {
                        Capsule()
                            .frame(width: thumbSize.width, height: thumbSize.height)
                            .foregroundColor(Color.white)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color.black)
                    }
                    .offset(x: getDragOffsetX(), y: 0)
                    .animation(Animation.spring(response: 0.3, dampingFraction: 0.8))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in self.handleDragChanged(value) })
                            .onEnded({ _ in self.handleDragEnded() })
                    )
                }
                
                HStack(spacing:70){
                    
                    Button(action: {
                               // Open your link here
                               if let url = URL(string: "https://www.privacypolicyonline.com/live.php?token=Ep038SzFtAsAZ66Hwq7vobMKU9zMNeO4") {
                                   UIApplication.shared.open(url)
                               }
                    }) {
                        Text("Terms &\nConditions")
                            .font(Font.custom("ethnocentric", size: 7))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                
                    Button(action: {
                               // Open your link here
                               if let url = URL(string: "https://www.eulatemplate.com/live.php?token=2ES0BKgZy1PpvfkNlg9OXd9HotWtMjwf") {
                                   UIApplication.shared.open(url)
                               }
                    }) {
                        Text("Privacy Policy")
                            .font(Font.custom("ethnocentric", size: 7))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    
                    
                    
                }
            }
            .padding(.bottom, 10.02778)
        }
        .frame(width: 365, height: 276)
        .cornerRadius(27.02778)
        .overlay(
                        RoundedRectangle(cornerRadius: 27.02778) // Adjust corner radius as needed
                            .stroke(Color.white.opacity(0.8), lineWidth: 1) // Set the white stroke color and width
                    )
  
    }
    
    
    // MARK: - Haptic feedback
    private func indicateCanLiftFinger() -> Void {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    private func indicateSwipeWasSuccessful() -> Void {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    // MARK: - Helpers
    private func getDragOffsetX() -> CGFloat {
        // should not be able to drag outside of the track area
        
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 0, trackSize.width - thumbSize.width)
        
        return -( trackSize.width/2 - thumbSize.width/2 - (clampedDragOffsetX))
    }
    
    // MARK: - Gesture Handlers
    private func handleDragChanged(_ value:DragGesture.Value) -> Void {
        self.dragOffset = value.translation
        
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width*2)
        let wasInitiated = dragWidth > 2
        let didReachTarget = dragWidth > targetDragWidth
        
        self.thumbSize = wasInitiated ? CGSize.activeThumbSize : CGSize.inactiveThumbSize
        
        if didReachTarget {
            // only trigger once!
            if !self.isEnough {
                self.indicateCanLiftFinger()
            }
            self.isEnough = true
        }
        else {
            self.isEnough = false
        }
    }
    
    private func handleDragEnded() -> Void {
        // If enough was dragged, complete swipe
        if self.isEnough {
            self.dragOffset = CGSize(width: self.trackSize.width - self.thumbSize.width, height: 0)
            
            // the outside world should be able to know
            if nil != self.actionSuccess {
                self.indicateSwipeWasSuccessful()
                
                // wait and give enough time for animation to finish
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.actionSuccess!()
                }
            }
            
        }
        else {
            self.dragOffset = .zero
            self.thumbSize = CGSize.inactiveThumbSize
        }
        
        
        
    }
    
}

extension SwipeView {
    func onSwipeSuccess(_ action: @escaping () -> Void ) -> Self {
        var this = self
        this.actionSuccess = action
        return this
    }
}


#Preview {
    SwipeView()
}




