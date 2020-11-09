//
//  P1.m3 - magicSquare.swift
//  week 2-1
//
//  Created by Lia on 2020/11/09.
//

import Foundation

func makeMagicSquare(squareNum:Int) -> Array<Array<Int>> {
    
    var magicSqure = Array(repeating: Array(repeating: 0, count: squareNum), count: squareNum)

    let firstPosition = (squareNum - 1)/2       // 첫 수 1의 배치
    var position = (row: 0, column : firstPosition)
    
    for index in 1...(squareNum * squareNum) {
        magicSqure[position.row][position.column] = index
        
        // 극단값: 배열 범위를 넘어가는 경우 케이스 별로
        if (position.row == 0 || position.column == (squareNum - 1)){
            switch position {
            case (0, squareNum - 1):
                position.row += 1
            case (0, _):
                position.row = squareNum - 1
                position.column += 1
            case (_, squareNum - 1):
                position.row -= 1
                position.column = 0
            default:
                print("error")
            }
        }
        
        // 내부값: 대각선 방향에 값이 있는 경우 & 없는 경우
        else {
            if (magicSqure[position.row - 1][position.column + 1] == 0){
                position.row -= 1
                position.column += 1
            }
            else {
                position.row += 1
            }
        }
    } // end of for
    return magicSqure
}


// print
func printMagicSquare(arr: Array<Array<Int>>){
    let squareNum = arr.count
    for row in 0..<squareNum {
        print(arr[row])
    }
}
