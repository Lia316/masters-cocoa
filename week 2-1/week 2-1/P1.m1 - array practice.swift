//
//  P1.m1 - array practice.swift
//  week 2-1
//
//  Created by Lia on 2020/11/09.
//

import Foundation

struct ArrayPractice {
    var arr : [[Int]] = Array(repeating: Array(repeating: 0, count:5 ), count: 5)

    init() {
        var index = 0
        for row in 0..<5 {
            for column in 0..<5 {
                index += 1
                if (row >= column) {
                    arr[row][column] = index
                }
            }
        }
    }
    
    func fillArray() -> Array<Array<Int>> {
        var bigArray = Array<Array<Int>>()
        for row in 0..<5 {
            var rowArray : [Int] = []
            for column in 0..<5 {
                if arr[row][column] != 0 {
                    rowArray.append(arr[row][column])
                }
            }
            bigArray.append(rowArray)
        }
        return bigArray
    }
    
    func printArray(array:Array<Array<Int>>) {
        for row in 0..<5 {
            print(array[row])
        }
    }
}
