//
//  Bubble sort.swift
//  week 3-1
//
//  Created by Lia on 2020/11/16.
//

import Foundation

class BubbleSort {
    let unsorted : [Int]
    
    init(numbers : [Int]) {
        unsorted = numbers
    }
    
    func sorted(isAscending: Bool) -> Array<Int>{
        var sortedArr = unsorted
        
        func swap(_ aIndex: Int, _ bIndex: Int){
            let temp = sortedArr[aIndex]
            sortedArr[aIndex] = sortedArr[bIndex]
            sortedArr[bIndex] = temp
        }
        
        var swapped : Bool
        var lastIndex = unsorted.count - 1
        
        repeat{ // swapped 가 한 번이라도 false 면 while문이 계속 돌아감
            swapped = true
            for index in 0..<lastIndex{
                if isAscending {
                    if sortedArr[index] > sortedArr[index + 1] { swap(index, index + 1) }
                    if swapped && index > 0 { swapped = sortedArr[index] > sortedArr[index - 1] }
                }
                else{
                    if sortedArr[index] < sortedArr[index + 1] { swap(index, index + 1) }
                    if swapped && index > 0 { swapped = sortedArr[index] < sortedArr[index - 1] }
                }
            }
            lastIndex -= 1
        } while(!swapped)
        
        return sortedArr
    }
}

// print("\(index),\(sortedArr)")
// 디버깅 할 때
