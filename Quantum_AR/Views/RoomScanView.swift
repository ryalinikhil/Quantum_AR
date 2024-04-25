//
//  RoomScanView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 21/01/24.
//


import SwiftUI

struct RoomScanView: View {
    @State private var submittedExportRequest = false
   // @ObservedObject private var captureController = Quantum_ARApp.captureController
    @Binding var isPresented: Bool
   // @EnvironmentObject private var captureController: RoomCaptureController // Declare here
    @State private var submittedName = "" // confirmed that this one will be processed
    var body: some View {
        ZStack{
            
         
            
            HStack {
                
               
                 //FetchModelView()
                VStack {
                    
                    HStack{
                        
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
                        
                    }
                    .padding()
                    
                    
                    ARViewWrapper(submittedExportRequest: self.$submittedExportRequest, submittedName: self.$submittedName)
                    // .ignoresSafeArea()
                    
                    Button("Export") {
                        alertTF(title: "Save file", message: "enter your file name", hintText: "my_file", primaryTitle: "Save", secondaryTitle: "cancel") { text in
                            self.submittedName = text
                            self.submittedExportRequest.toggle()
                        } secondaryAction: {
                            print("Cancelled")
                        }
                        
                    }
                    
                    .padding()
                }
            }
         
            ZStack{
                Rectangle()
                    .cornerRadius(20)
                    .frame(width: 250, height: 250)
                    .foregroundColor(.white)
                
                VStack{
                    Text("This feature will be available Soon..")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(width: 150, height:100 )
                        .padding()
                    
                    HStack{
                        
                        Spacer()
                        
                      Image("arlogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                    
                }
                .frame(width: 250, height: 250)
            }
        }
    }
}

/*struct RoomScanView_Previews: PreviewProvider {
    static var previews: some View {
        RoomScanView()
    }
}
*/

extension View {
    func alertTF(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primaryAction: @escaping (String) -> (), secondaryAction: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        alert.addAction(.init(title: primaryTitle, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text {
                primaryAction(text)
            } else {
                primaryAction("")
            }
        }))
        
        // presenting alert
        rootController().present(alert, animated: true, completion: nil)
    }
    
    
    func rootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}


/*
#Preview {
    RoomScanView()
}
*/
