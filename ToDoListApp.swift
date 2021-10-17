//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by student on 4/23/21.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
   @StateObject var listViewModel : MainViewModel  = MainViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(MainViewModel())
        }
    }
}
