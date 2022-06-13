//
//  ContentView.swift
//  SwiftUiBindingTest
//
//  Created by Vitek Tajzich on 13.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ContentModel()
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Root:    ")
                Spacer()
                TextField("Root", text: $model.root)
                Spacer()
                Text($model.root.wrappedValue)
                Spacer()
                Button {
                    model.updateRoot()
                } label: {
                    Text("Update Value")
                }
            }.background(Color.mint)
            
            HStack {
                Text("Level 1: ")
                Spacer()
                TextField("Level 1", text: $model.level1.value)
                Spacer()
                Text($model.level1.value.wrappedValue)
                Spacer()
                Button {
                    model.updateLevel1()
                } label: {
                    Text("Update Value")
                }
            }.background(Color.orange)
            
            HStack {
                Text("Level 2: ")
                Spacer()
                TextField("Level 2", text: $model.level1.level2.value)
                Spacer()
                Text($model.level1.level2.value.wrappedValue)
                Spacer()
                Button {
                    model.updateLevel2()
                } label: {
                    Text("Update Value")
                }
            }.background(Color.yellow)
            
            HStack {
                Text("Level 3: ")
                Spacer()
                TextField("Level 3", text: $model.level1.level2.level3.value)
                Spacer()
                Text($model.level1.level2.level3.value.wrappedValue)
                Spacer()
                Button {
                    model.updateLevel3()
                } label: {
                    Text("Update Value")
                }
            }.background(Color.cyan)
        }
        
        Button {
            model.reassignLevel1()
        } label: {
            Text("Reassign level 1: value -> nil -> value")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
