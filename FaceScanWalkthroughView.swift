import SwiftUI

struct FaceScanWalkthroughView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 24) {
//            Image("guide")
            VStack {
                Image("Logo")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("iProov Demo App")
            }
            Text("We need to scan your face")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Let's make your face scan a success!")
                .font(.title2)
            
            HStack {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.accentColor)
                Text("Turn up your screen brightness. Need help?")
                    .onTapGesture {
                        // Show brightness tutorial
                    }
            }
            
            NavigationLink(destination: ScanningView()) {
                Text("Review our scanning tips")
                    .foregroundColor(.accentColor)
            }
            
//            Button("Accessibility Features") {
//                // Open accessibility settings view
//            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Begin Scan")
                    .font(.headline)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .accessibility(label: Text("Begin Face Scan Button"))
        }
        .padding()
        .navigationTitle("")
    }
}
