//
//  RoomView.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 18/01/24.
//


import SwiftUI
import RoomPlan

struct CaptureView : UIViewRepresentable
{
  @Environment(RoomCaptureController.self) private var captureController

  func makeUIView(context: Context) -> some UIView {
    captureController.roomCaptureView
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct ActivityView: UIViewControllerRepresentable {
  var items: [Any]
  var activities: [UIActivity]? = nil
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
    let controller = UIActivityViewController(activityItems: items, applicationActivities: activities)
    return controller
  }
  
  func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}

struct ScanningView: View {
  @Environment(\.presentationMode) var presentationMode
  @Environment(RoomCaptureController.self) private var captureController
  
  
  var body: some View {
    @Bindable var bindableController = captureController
    
    ZStack(alignment: .bottom) {
      CaptureView()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button("Cancel") {
          captureController.stopSession()
          presentationMode.wrappedValue.dismiss()
        })
        .navigationBarItems(trailing: Button("Done") {
          captureController.stopSession()
          captureController.showExportButton = true
        }.opacity(captureController.showExportButton ? 0 : 1)).onAppear() {
          captureController.showExportButton = false
          captureController.startSession()
        }
      Button(action: {
        captureController.export()
      }, label: {
        Text("Export").font(.title2)
      }).buttonStyle(.borderedProminent)
        .cornerRadius(40)
        .opacity(captureController.showExportButton ? 1 : 0)
        .padding()
        .sheet(isPresented: $bindableController.showShareSheet, content:{
          ActivityView(items: [captureController.exportUrl!]).onDisappear() {
            presentationMode.wrappedValue.dismiss()
          }
        })
    }
  }
}

struct ContentView55: View {
    @EnvironmentObject private var captureController: RoomCaptureController // Declare here
  var body: some View {
    NavigationStack {
      VStack {
          
          Image("roomp")
              .resizable()
              .aspectRatio(contentMode: .fit)
          
          HStack(spacing: 10){
              Image(systemName: "camera.metering.matrix")
                  .imageScale(.large)
                  .foregroundColor(.accentColor)
              Text("RoomScanner").font(.title)
          }
        Spacer().frame(height: 40)
        Text("Scan the room by pointing the camera at all surfaces. Model export supports USDZ format.")
        Spacer().frame(height: 40)
        NavigationLink(destination: ScanningView(), label: {Text("  Start Scan   ")}).buttonStyle(.borderedProminent).cornerRadius(40).font(.title2)

      }
    }
  }
}

struct ContentView55_Previews: PreviewProvider {
  static var previews: some View {
    ContentView55()
         // .environment(Quantum_ARApp.captureController)
  }
}
