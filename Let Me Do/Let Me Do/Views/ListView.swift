//
//  ListView.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    @State var isToggle : Bool = false
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.easeOut){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if listViewModel.items.count > 0{
                        EditButton()
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isToggle.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .font(.headline)
                            .padding(5.0)
                            .background(Color.white.cornerRadius(10.0))
                    }).sheet(isPresented: $isToggle){
                        AddSheetView()
                    }
//                    NavigationLink("Add", destination: AddView())
                    
                }
            }
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }.environmentObject(ListViewModel())
    }
}


