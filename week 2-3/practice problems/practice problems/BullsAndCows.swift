//
//  BullsAndCows.swift
//  practice problems
//
//  Created by Lia on 2020/11/11.
//

import Foundation

struct BullsAndCows {
    
    var baseballNum : Int
    init() {
        baseballNum = 0
    }
    
    // 임의의 3자리 숫자 생성해서 내부 프로퍼티에 저장
    mutating func newGame() {
        self.baseballNum = Int.random(in: 100...999)
    }
    
    // 3자리 숫자를 비교 후 결과(숫자 위치까지 맞춘 경우, 위치만 다른 경우)를 리턴
    func hit(num:Int) -> (strikeCount:Int, ballCount:Int){
        
        
        return (1,2)
    }
    
    // 9번내에 스트라이크 3개 모두 맞췄으면 성공(true). 아니면 실패(false)
    func showGameScore() -> Bool{
        
        return true
    }
    
}



