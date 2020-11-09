//
//  P1.m2 - setBoolArray.swift
//  week 2-1
//
//  Created by Lia on 2020/11/09.
//

import Foundation
// RightTree 구조로 true 값 넣음
func setBoolArray() -> Array<Array<Bool>> {
    
    let squareNum = 7
    var boolArray = Array(repeating: Array(repeating: true, count: squareNum), count: squareNum)
    
    for row in 0..<squareNum {
        for column in 0..<squareNum {
            if (row < squareNum - column - 1) {
                boolArray[row][column] = false
            }
        }
    }
    
    return boolArray
}
// true 값 -> Character 로 바꿔 print
func printArray(array:Array<Array<Bool>>, newChar:Character) {
    let squareNum = array.count
    for row in 0..<squareNum {
        for column in 0..<squareNum {
            if array[row][column] {
                print(newChar, terminator: "")
            }
            else {
                print(" ", terminator: "")
            }
        }
        print()
    }
}
