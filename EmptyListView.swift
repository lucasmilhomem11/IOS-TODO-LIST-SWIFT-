//
//  EmptyListView.swift
//  ToDoList
//
//  Created by student on 5/10/21.
//

import SwiftUI

struct EmptyListView: View {
    @State var animate : Bool = false
   
    var body: some View {
        ScrollView {
            VStack{
                Text("0 items!").font(.title3).fontWeight(.bold)
                Text("Lets go, this list seems boring. It is time to add new items, time to start your list. You can add as many items as you want, make this To Do List the best!! 😝").padding()
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something New").foregroundColor(.white).font(.title2).frame(height: 50).frame(maxWidth: .infinity).background(animate ? Color.pink : Color.blue).cornerRadius(11)
                    })
                    .padding(.horizontal, animate ? 35 : 55).shadow(color: .black, radius: 10, x: 1.0, y: 1.0 ).scaleEffect(animate ? 1.1 : 1.0).offset(y: animate ? -7 : 0)

            }
            .multilineTextAlignment(.leading).padding()
            .onAppear(perform: newAnimation)
        }
    
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
    }


    func newAnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)
            ){
                animate.toggle()
            }
        }
    }
}


struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EmptyListView()
                .navigationTitle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Title@*/Text("Title")/*@END_MENU_TOKEN@*/)

        }
    }
}

