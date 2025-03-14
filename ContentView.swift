//
//  ContentView.swift
//  iosapp-iproov
//
//  Created by Fawad Niazi on 14/03/2025.
//

import SwiftUI

import iProov
import iProovAPIClient
import MBProgressHUD
import UIKit

struct ContentView: View {
    
    // NOTE: This is provided for example/demo purposes only. You should never embed your credentials in a public app release!
 

    
    @State private var showWalkthrough = true
    var body: some View {
        
        VStack {
            Image("Logo")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("iProov Demo App")
        }
       
        TextField(
                "User ID",
                text: .constant("64ee87e6-3c65-4752-ac15-a4158f065c4d")
                
            )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary).frame(width: 300, height: 50)
            
        NavigationLink(destination: ScanningView()) {
            Text("Enrol with Genuine Presence Assurance")
                      .font(.title2)
                      .foregroundColor( Color.accent) 

           
        }
    .padding()
    .sheet(isPresented: $showWalkthrough) {
        NavigationStack {
            FaceScanWalkthroughView()
        }
    }
}
}

#Preview {
    ContentView()
}
