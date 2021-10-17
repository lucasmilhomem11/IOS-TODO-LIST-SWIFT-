//
//  ContentView.swift
//  ToDoList
//
//  Created by student on 4/23/21.
//

import SwiftUI

struct ListView: View {
    
/* had to look this up --> */ @EnvironmentObject var MainViewModel : MainViewModel
    
    var body: some View {
        ZStack{
            if MainViewModel.items.isEmpty {
                EmptyListView()
            } else{
                List {
                    ForEach(MainViewModel.items) { item in
                        ListRowView(item: item).onTapGesture {
                            withAnimation(.easeIn) {
                                MainViewModel.updateList(item: item)
                            }
                        }
                    }
                    .onDelete(perform: MainViewModel.deleteItem).onMove(perform: MainViewModel.moveItem)
                   
                }
            }
            
        }
        .navigationTitle("To Do List!!😃").navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add to List", destination: AddView()))
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
            
        }
        .environmentObject(MainViewModel())
    }
}

