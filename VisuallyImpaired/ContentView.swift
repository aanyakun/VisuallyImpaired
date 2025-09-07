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
            
            Text("App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            HStack(spacing:0) {
                
                //ZStack{
                //   RoundedRectangle(cornerRadius:30)
                //     .fill(Color.blue)
                //     .frame(height:150)
                //    .frame(maxWidth: .infinity)
                // }
                Text("Camera")
                    .font(.system(size:45))
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                   .frame(maxHeight: .infinity)
                    .background(Color.blue)
                
                Text("Settings")
                font(.system(size:45))
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .background(Color.blue)
                
                
            }
            
            .frame(maxWidth: .infinity,maxHeight: .infinity)
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
    
    
    
    
