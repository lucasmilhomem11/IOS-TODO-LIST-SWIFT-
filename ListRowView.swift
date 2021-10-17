//
//  ListRowView.swift
//  ToDoList
//
//  Created by student on 4/23/21.
//

import SwiftUI


struct ListRowView: View {
    let item : itemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ?  "checkmark.square" : "square").foregroundColor(item.isCompleted ? .blue : .red)
            Text(item.title).padding()
            Spacer()
            
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var firstItem = itemModel( title: "first item", isCompleted: false)
    static var secondItem = itemModel( title: "second item", isCompleted: true)
    static var thirdItem = itemModel(title: "third item", isCompleted: true)
    static var previews: some View {
        VStack{
            ListRowView(item: firstItem)
            ListRowView(item: secondItem)
            ListRowView(item: thirdItem)
        }
        
    }
}
