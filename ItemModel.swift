//
//  ItemModel.swift
//  ToDoList
//
//  Created by student on 5/3/21.
//

import Foundation

struct itemModel : Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool)
    {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func markTask() -> itemModel {
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}




