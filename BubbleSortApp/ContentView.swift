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
    @State private var reverseCondition = false
    @State private var inputString: String = ""
    @State private var stringArray: [String] = []
    @State private var sortedArray: [[Float]] = []
    @State private var floatArray: [Float] = []
    
    var body: some View {
        VStack {
            titleArea
            reverseButton
            inputArea
            listView
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
                floatArray = stringArray.compactMap({ Float($0) })
                sortedArray = bubbleSort(&floatArray, reverse: reverseCondition)
                
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
    
    var reverseButton: some View {
        Button(action: {
            reverseCondition.toggle()
        }, label: {
            Text(reverseCondition ? "Descending" : "Ascending")
                .frame(width: 100)
        })
        .buttonStyle(.bordered)
    }
    
    var listView: some View {
        List(sortedArray, id: \.self) { step in
            Text(step.map { String(format: "%.f", $0) }.joined(separator: ", "))
        }
        .padding()
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

private extension ContentView {
    func bubbleSort(_ array: inout [Float], reverse: Bool = false) -> [[Float]] {
        var array = array
        var steps: [[Float]] = []
        let number = array.count
        
        for i in 0..<number {
            for j in 0..<number-i-1 {
                //All above things are of the same
                //Only thing changing is the condition [if] parts -> A variable based on the [reverse]
                let shouldSwap: Bool = reverse ? array[j] < array[j+1] : array[j] > array[j+1]
                
                if shouldSwap {
                    array.swapAt(j, j+1)
                }
            }
            steps.append(array)
        }
        return steps
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
