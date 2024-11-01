//
//  ContentView.swift
//  BubbleSortApp
//
//  Created by Daniel Zhang on 01/11/2024.
//

import SwiftUI

//We need to turn the [string] (with simple texts) to an [array]
struct ContentView: View {
    //Declare a bindable variable
    @State private var inputString: String = ""
    @State private var stringArray: [String] = []
    
    var body: some View {
        VStack {
            titleArea
            inputArea
        }
        .padding()
    }
}


//MARK: - Subview
private extension ContentView {
    var inputArea: some View {
        HStack {
            TextField("Input String with \" , \"", text: $inputString)
                .padding()
                .background(Color(.systemGray6))
                .styled()
            
            Button(action: {
                stringArray = inputString.split(separator: ",")
                //[.map] returns an arry containg the results of remapping
                //[$0} means any element
                //[.trimmingCharacter(in:)] is a function removing both ends of receivers
                    .map{ $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            }) {
                Text("Convert")
                    .padding()
                    .foregroundStyle(Color(.systemGray6))
                    .background(Color.accentColor)
                    .styled()
            }
        }
        .padding()
    }
    
    var titleArea: some View {
        Label("Bubble Sort", systemImage: "text.page.badge.magnifyingglass")
            .font(.largeTitle.bold())
            .foregroundStyle(Color.accentColor)
    }
}

//use [ViewModifier] to define a new struct can be used in [extension View]
struct StyledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.accentColor, lineWidth: 3)
                    .frame(height: 50)
            )
    }
}

//apply the [ViewModifier] into the [func]
extension View {
    func styled() -> some View {
        self.modifier(StyledModifier())
    }
}

#Preview {
    ContentView()
}
