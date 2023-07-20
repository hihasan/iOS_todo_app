//
//  ListViewModel.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "This is the First title!", isCompleted: false),
            ItemModel(title: "This is the Second title!", isCompleted: true),
            ItemModel(title: "This is the Third title!", isCompleted: false),
            ItemModel(title: "This is the Forth title!", isCompleted: false),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item : ItemModel){
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    
}
