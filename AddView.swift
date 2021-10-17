//
//  AddView.swift
//  ToDoList
//
//  Created by student on 4/23/21.
//

import SwiftUI

struct AddView: View {
/* looked this up to figured out -> */   @Environment(\.presentationMode) var presentationMode
/* looked this up to figured out -> */   @EnvironmentObject var MainViewModel : MainViewModel
/* looked this up to figured out -> */  @State var textFieldText: String = ""
    @State var animate : Bool = false
    var body: some View {
        ScrollView {
            //figure out how to make text field to read information
            VStack {
                TextField("Enter your items...", text: $textFieldText).padding(
                ).background(Color.gray).frame(height: 40)
                .cornerRadius(11)
                
                Button(action: pressEnterButton, label: {
                    Text("Enter".uppercased()).scaleEffect().foregroundColor(.white).font(.subheadline).frame(height: 50).frame(maxWidth: 420).background(animate ? Color.pink : Color.blue).cornerRadius(11).cornerRadius(5)
                })
                .padding(.horizontal, animate ? 25 : 45).shadow(color: .black, radius: 10, x: 1.0, y: 1.0 ).scaleEffect(animate ? 1.1 : 1.0).offset(y: animate ? -7 : 0).padding()
            }
            .onAppear(perform: newAnimation)
            
        }
        
        .navigationTitle("Add item:")
    }
    
    func pressEnterButton() {
        MainViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
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

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()

        }
        .environmentObject(MainViewModel())

    }
}
