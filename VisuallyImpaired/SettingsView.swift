//

import SwiftUI


struct SettingsView: View {
    var body: some View {
            VStack(spacing:0) {
                
                
                HStack(spacing:0) {
                    // ZStack  {
                    // RoundedRectangle(cornerRadius: 40).fill(.blue)
                
                        
                        
                        Text("Change Language")
                            .font(.system(size:45,weight: .bold))
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 2)
                            .background(.red)
                    Text("Leave a review")
                        .font(.system(size:45,weight: .bold))
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 2)
                        .background(.yellow)
                    }
                HStack(spacing:0) {
                    // ZStack  {
                    // RoundedRectangle(cornerRadius: 40).fill(.blue)
                
                        
                        
                        Text("Exit Settings")
                            .font(.system(size:45,weight: .bold))
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 2)
                            .background(.green)
                    Text("Exit App")
                        .font(.system(size:45,weight: .bold))
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 2)
                        .background(.blue)
                    }
                    
                   
                   
                
                   
                   
                    
                    //  }
                }
               
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

    
    #Preview {
       SettingsView()
        
        
    }
    
    
    
    
