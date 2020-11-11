//
//  BullsAndCows.swift
//  practice problems
//
//  Created by Lia on 2020/11/11.
//

import Foundation


struct BullsAndCows {
    
    var baseballNum : Int
    var numPosition : Array<Int>
    var playNum : Int
    var strikeNum : Int
    
    init() {
        baseballNum = 0
        numPosition = [0, 0, 0]
        playNum = 0
        strikeNum = 0
    }
    
    // 일, 십, 백의 자리 나눠주는 함수
    func splitPosition(num: Int) -> Array<Int>{
        let splitArray = [num / 100, num % 100 / 10, num % 10]
        return splitArray
    }
    
    // 겹치지 않는 임의의 3자리 숫자 생성해서 내부 프로퍼티에 저장
    mutating func newGame() {
        var splitNum = self.numPosition
        repeat {
            self.baseballNum = Int.random(in: 100...999)
            splitNum = splitPosition(num: baseballNum)
        } while((splitNum[0] == splitNum[1]) || (splitNum[1] == splitNum[2]) || (splitNum[2] == splitNum[0]))
        
    }
    
    // 3자리 숫자를 비교 후 결과(숫자 위치까지 맞춘 경우, 위치만 다른 경우)를 리턴
    mutating func hit(num:Int) -> (strikeCount:Int, ballCount:Int){
        var count = (strikeCount: 0, ballCount: 0)
        var hitNum = numPosition
        
        numPosition = splitPosition(num: baseballNum)
        hitNum = splitPosition(num: num)
        
        for index in 0..<3 {
            if(numPosition.contains(hitNum[index])){
                if(numPosition[index] == hitNum[index]){
                    count.strikeCount += 1
                }else{
                    count.ballCount += 1
                }
            }
        }
        playNum += 1
        strikeNum = count.strikeCount
        return (count.strikeCount, count.ballCount)
    }
    
    // 9번내에 스트라이크 3개 모두 맞췄으면 성공(true). 아니면 실패(false)
    func showGameScore() -> Bool{
        return ((playNum <= 9) && (strikeNum == 3))
    }
}





