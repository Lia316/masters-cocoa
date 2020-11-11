//
//  main.swift
//  practice problems
//
//  Created by Lia on 2020/11/11.
//

import Foundation

// 1~365일까지 unitDay단위씩 증가하면서, 원금 100만원을 예금할 때 이자+원금을 확인하는 함수 <- main
func testInterest(unitDay : Int) -> Double{
    let money = 1000000
    let test = InterestCalculator(day: unitDay, amount: money)
    return test.calculateAmount(day: unitDay, amount: money)
}

for day in stride(from: 10, to: 366, by: 10){
        print("예치일:\(day)   \(testInterest(unitDay: day))")
}

var some = BullsAndCows()

some.newGame()
print(some.baseballNum)
