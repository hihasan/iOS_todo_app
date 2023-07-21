//
//  LaunchScreenView.swift
//  Let Me Do
//
//  Created by Hasan Al Mamun on 22/7/23.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var isActive : Bool = false
    
    var body: some View {
        NavigationStack{
            if isActive == true{
                ListView()
            } else{
                ZStack{
                    Color.accentColor.edgesIgnoringSafeArea(.all)
                    LaunchAnimationUI()
        
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                      isActive = true
                        
                    }
                }
                    
            }
        }
    }
    
    
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
