//
//  ListView.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [ItemModel]=[
        ItemModel(title: "This is the First title!", isCompleted: false),
        ItemModel(title: "This is the Second title!", isCompleted: true),
        ItemModel(title: "This is the Third title!", isCompleted: false),
        ItemModel(title: "This is the Forth title!", isCompleted: false),
    ]
    
    var body: some View {
        List{
            ForEach(items){ item in
                ListRowView(item: item)
            }
            
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                    
                }
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
    }
}


