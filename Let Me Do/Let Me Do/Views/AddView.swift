//
//  AddView.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.yellow.edgesIgnoringSafeArea(.all)
            ScrollView {
                HStack {
                    Text("Add An Item ✏️")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .font(.headline)
                        .foregroundColor(Color.yellow)
                        .padding(20.0)
                        .background(Color.white.cornerRadius(10.0))
                    
                }.padding(.horizontal)
                    .padding(.vertical)
                VStack {
                    TextField("Type Something Here......", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color.white.opacity(0.7))
                    .cornerRadius(10.0)
                    
                    Button(action: {
                        saveBtnPressed()
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
            }
            .alert(isPresented: $showAlert, content: getAlert)
        }
        
    
    }
    
    func saveBtnPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your New Add new Item must be at least 3 charecters 🥲"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert{
        
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
