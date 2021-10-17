//
//  MainViewModel.swift
//  ToDoList
//
//  Created by student on 5/3/21.
//

import Foundation

class MainViewModel : ObservableObject {
    @Published var items = [itemModel]() {
        didSet{
            save()
        }
    }
    
    init(){
        getItems()
    }
    
    
    func getItems() {
/* had to look this up
because the other way
was not working */
//        guard
           if let data = UserDefaults.standard.data(forKey: listOfItems),
            let savedItems = try? JSONDecoder().decode([itemModel].self, from: data)
           {
            return  self.items = savedItems
        }
       
        
    }
    func deleteItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
        save()
        
    }
    func moveItem( from:  IndexSet, to : Int)
    {
        items.move(fromOffsets: from, toOffset: to)
        save()
    }
    func addItem(title: String)
    {
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
        save()
    }
    
    func updateList(item: itemModel){
        
        if let index = items.firstIndex(where: { $0.id == item.id})
        {
            items[index] = item.markTask()
        }
        save()
        
       
    }
    func save()
    {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: listOfItems)
        }
    }
    
    let listOfItems : String = "List of items"
    
}
