//
//  bubbleSort.swift
//  BubbleSortApp
//
//  Created by Daniel Zhang on 01/11/2024.
//


//use [inout] to show that it is adjustable, it allows the code to adjust the array directly

//use [_] to ignore the label of the parameters, so can use bubbleSort(&array) directly.

//use reverse to adjust the condition
func bubbleSort(_ array: inout [Float], reverse: Bool = false) {
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
        print(array)
    }
}
