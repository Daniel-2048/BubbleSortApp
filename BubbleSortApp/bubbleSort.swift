//
//  bubbleSort.swift
//  BubbleSortApp
//
//  Created by Daniel Zhang on 01/11/2024.
//


//use [inout] to show that it is adjustable, it allows the code to adjust the array directly

//use [_] to ignore the label of the parameters, so can use bubbleSort(&array) directly.

var reverse: Bool = false

func bubbleSort(_ array: inout [Float]) {
    let number = array.count
    
    for i in 0..<number {
        for j in 0..<number-i-1 {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
        print(array)
    }
}

func reverseBubbleSort(_ array: inout [Float]) {
    let number = array.count
    
    for i in 0..<number {
        for j in 0..<number-i-1 {
            if array[j] < array[j+1] {
                array.swapAt(j, j+1)
            }
        }
        print(array)
    }
}
