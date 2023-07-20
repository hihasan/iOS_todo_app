//
//  ItemModel.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import Foundation

struct ItemModel : Identifiable{
    let id : String = UUID().uuidString
    let title : String
    let isCompleted : Bool
}
