//
//  AddView.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText : String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here......", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                .cornerRadius(10.0)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10.0)
                })
            }.padding(.all, 14.0)
        }.navigationTitle("Add An Item ✏️")
    
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }
    }
}
