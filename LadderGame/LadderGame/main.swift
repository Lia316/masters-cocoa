//
//  main.swift
//  LadderGame
//
//  Created by Lia on 2020/11/05.
//

import Foundation


enum LadderError : Error {
    case invalidNum
}

// 인원 수 입력 함수
func inputHeadcount () throws -> Int{
    
    print("사다리 게임에 참여할 인원을 입력하세요 :")
    var headcount = Int(readLine()!)!

    guard (headcount >= 2 && headcount <= 8) else {
        throw LadderError.invalidNum
    }
    return headcount
}



// 사다리 랜덤 다리 및 출력 함수
func printLadder (headcount : Int, height : Int = 4) {
    var ladderArray = Array(repeating:Array(repeating: "", count: headcount - 1), count: height)
    
    for row in 0..<height {
        print("|", terminator : "")
        for column in 0..<headcount - 1 {
            ladderArray[row][column] = Int.random(in: 0...100)%2 == 0 ? " " : "-"
            print(ladderArray[row][column], terminator : "")
            print("|", terminator : "")
        }
        print("\n")
    }
}

// error handling check
do {
    let numOfPpl : Int = try inputHeadcount()
    printLadder(headcount: numOfPpl)
} catch LadderError.invalidNum {
    print ("error")
    exit(0)
}

