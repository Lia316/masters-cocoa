//
//  Interest Calculator.swift
//  practice problems
//
//  Created by Lia on 2020/11/11.
//

import Foundation

struct InterestCalculator {
    let day : Int
    let amount : Int
    
    init(day : Int, amount : Int) {
        self.day = day
        self.amount = amount
    }
    
    // 일자(day)를 매개 변수로 받아서 이자율(%)이 얼마인지 계산하는 메서드
    func getInterestRate(byDay:Int) -> Double {
        var interestRate : Double = 0
        
        switch byDay {
        case 1...90:
            interestRate = 0.5
        case 91...180:
            interestRate = 1
        case 181...364:
            interestRate = 2
        case 365...:
            interestRate = 5.6
        default:
            break
        }
        
        return interestRate
    }
    
    // 예치 계산 금액을 계산해서 리턴하는 메서드
    func calculateAmount(day:Int, amount:Int) -> Double{
        return (Double(amount) * (100.0 + getInterestRate(byDay: day)))/100
        }
}

