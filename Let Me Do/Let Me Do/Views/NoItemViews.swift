//
//  NoItemViews.swift
//  Let Me Do
//
//  Created by Hasan Al Mamun on 22/7/23.
//

import SwiftUI

struct NoItemViews: View {
    @State var isAnimate : Bool = false
    @State var isToggle : Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10.0){
                Button(action: {
                    isToggle.toggle()
                }, label: {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 90.0))
                        .foregroundColor(isAnimate ? .accentColor.opacity(0.5) : .accentColor)
                        .padding(.horizontal, isAnimate ? 30.0 : 50.0)
                        .shadow(
                            color: isAnimate ? .accentColor.opacity(0.7) : .accentColor.opacity(0.7),
                            radius: isAnimate ? 30.0 : 10.0,
                            x: 0.0,
                            y: isAnimate ? 50.0 : 30.0
                        )
                        .padding(.bottom, 50.0)
                        .scaleEffect(isAnimate ? 1.1 : 1.0)
                        .offset(y: isAnimate ? -7 : 0)
                }).sheet(isPresented: $isToggle){
                    AddSheetView()
                }
                Text("Add Your First Note")
                    .font(.title)
                Text("Write Something what is in your mind and what you want to accomplish. Be More Productive 😎")
                    .font(.headline).fontWeight(.thin)
                
            }
            .multilineTextAlignment(.center)
            .padding(40.0)
            .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
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

struct NoItemViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoItemViews()
        }
    }
}
