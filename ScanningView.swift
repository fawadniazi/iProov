//
//  ScanningView.swift
//  iosapp-iproov
//
//  Created by Fawad Niazi on 14/3/25.
//

import SwiftUI

struct ScanningView: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Image("ScanningTips")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 700)
                    .foregroundStyle(.tint)
                Text("iProov Demo App")
            }
//            VStack(alignment: .leading, spacing: 20) {
//                Text("Scanning Tips")
//                    .font(.largeTitle)
//                    .padding(.bottom, 20)
//                
//                ScanningTipSection(title: "Lighting", icon: "light.max.fill") {
//                    Text("Ensure your face is well-lit. Avoid backlit environments or harsh shadows.")
//                }
//                
//                ScanningTipSection(title: "Expression", icon: "faceid") {
//                    Text("Keep a neutral expression. Avoid exaggerated facial movements.")
//                }
//                
//                ScanningTipSection(title: "Position", icon: "arrow.up.and.down.left.and.right.and.square.fill") {
//                    Text("Hold the device at a comfortable distance. Face the camera directly.")
//                }
//                
//                ScanningTipSection(title: "Movement", icon: "person.fill.viewfinder") {
//                    Text("Nod slowly when prompted. Move naturally - no sudden gestures.")
//                }
//            }
//            .padding()
            .navigationTitle("Scanning Tips")
        }
    }
}

struct ScanningTipSection: View {
    let title: String
    let icon: String
    let content: () -> Text
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.accentColor)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            content()
                .font(.callout)
        }
        .padding(.vertical, 10)
    }
}
