//
//  ContentView.swift
//  VisuallyImpaired
//
//  Created by aanya kungwani on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:0) {
            Text("Visually Impaired App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            HStack(spacing:12) {
               // ZStack  {
               // RoundedRectangle(cornerRadius: 40).fill(.blue)
                Text("Camera")
                .font(.system(size:45,weight: .bold))
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 650)
                    .background(.blue, in: RoundedRectangle(cornerRadius: 35, style: .circular))
                    
                
                    //Spacer()
                
                Text("Settings")
                    .font(.system(size:45,weight: .bold))
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 650)
                    .background(.green, in: RoundedRectangle(cornerRadius: 35, style: .circular))
                
          //  }
            }
            
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            Text("Welcome!")
         .font(.largeTitle)
        }
    }
    
    
    
    //CameraView()
    //.edgesIgnoringSafeArea(.all)
    
    //VStack() {
    //  Image(systemName: "globe")
    //     .imageScale(.large)
    //  .foregroundStyle(.tint)
    // Text("Change 1!")
    //}
    // .padding()
}
    
    #Preview {
        ContentView()
        
        
    }
    
    
    
    
