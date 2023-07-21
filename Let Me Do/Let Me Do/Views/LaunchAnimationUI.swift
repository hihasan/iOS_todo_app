//
//  LaunchAnimationUI.swift
//  Let Me Do
//
//  Created by Hasan Al Mamun on 22/7/23.
//

import SwiftUI

struct LaunchAnimationUI: View {
    @State var isAnimate : Bool = false
    
    var body: some View {
        Image("launch_screen_img")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 256.0)
            .cornerRadius(25.0)
            .shadow(
                color: isAnimate ? .white.opacity(0.7) : .white.opacity(0.7),
                radius: isAnimate ? 30.0 : 10.0,
                x: isAnimate ? -50.0 : 30.0,
                y: isAnimate ? -50.0 : 30.0
            )
            .padding(.bottom, 50.0)
            .scaleEffect(isAnimate ? 1.1 : 1.0)
            .offset(y: isAnimate ? -7 : 0)
            .onAppear(perform: addAnimation)
    }
    
    func addAnimation(){
        guard !isAnimate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                .easeIn(duration: 2.0)
                .repeatForever()
            
            ){
                isAnimate.toggle()
                
                
            }
        }
    }
}

struct LaunchAnimationUI_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAnimationUI()
    }
}
