//
//  ContentView.swift
//  VisuallyImpaired
//
//  Created by aanya kungwani on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.red)
                .ignoresSafeArea()
        }
        VStack(spacing:40) {
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            ZStack{
                RoundedRectangle(cornerRadius:30)
                    .fill(Color.blue)
                Text("Camera")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
            }
            .padding(.top,30)
            
            
            Text("Settings")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(.black)
                .background(Color.blue)
                .cornerRadius(15)
        }
        .padding(.top,30)
        
        
        Spacer()
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
    

