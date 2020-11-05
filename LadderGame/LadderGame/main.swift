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

// 인원수 입력 함수
func inputHeadcount () throws -> Int{
    
    print("사다리 게임에 참여할 인원을 입력하세요 :")
    var headcount = Int(readLine()!)!
    print(headcount)
    guard (headcount > 2 && headcount < 8) else {
        throw LadderError.invalidNum
    }
    
    return headcount
}

// error handling check
do {
    let s : Int = try inputHeadcount()
    print(s)
} catch LadderError.invalidNum {
    print ("error")
    exit(0)
}

// exit(0) check
print (" 왜 안 되지")
