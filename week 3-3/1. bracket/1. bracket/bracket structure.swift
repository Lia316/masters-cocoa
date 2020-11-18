//
//  bracket structure.swift
//  1. bracket
//
//  Created by Lia on 2020/11/18.
//

import Foundation

enum bracket : String {
    case round = "()"
    case square = "[]"
    case curly = "{}"
}

struct ValidMatch {
    let bracket : String
    let left, right : String
    
    init(type : bracket) {
        bracket = type.rawValue
        left = String(bracket[bracket.startIndex])
        right = String(bracket[bracket.index(before: bracket.endIndex)])
    }
    // 숫자 <-> bracket 변환 함수
    func converter(with numbers: String, type: Bool) -> String{
        var some : String
        if(type){ some = numbers.map{$0 == "1" ? left : right }.joined() }
        else { some = numbers.map{$0 == Character(left) ? "1" : "0" }.joined() }
        return some
    }
    
    func generate(with count:Int) -> Array<String>{
        var allNumberArr = [String]()
        let arrCount = (Int(truncating: pow(10,count * 2 - 1) as NSNumber))
        // 앞자리가 1이고, count * 2 자리수의 0과 1로 이뤄진 숫자를 생성한다
        for index in 0..<(Int(truncating: pow(2, 2 * count - 1) as NSNumber)) {
                    allNumberArr.append(String(arrCount + Int(String(index, radix: 2))!))
                }
        // 전체 경우의 수 중, 조건에 맞는 경우만 filter
        let filteredArray = allNumberArr.filter { analyze(with: $0) }
        allNumberArr.removeAll()  // Q. 이러면 공간이 줄어드나요?
        
        return filteredArray.map{ converter(with: $0, type: true) }
    }
    
    func analyze(with value:String) -> Bool{
        var countLeft = 0
        let trueValue : String =
            (bracket.contains(value[value.startIndex])) ? converter(with: value, type: false) : value
        let valueArr = Array(trueValue).map {Int(String($0))!}
        // 괄호의 개수가 홀수인 경우, 괄호의 짝이 안 맞는 경우, 마지막 괄호가 열린 경우
        guard (trueValue.count % 2 == 0 && trueValue.split(separator: "0").joined() == String(repeating: "1", count: trueValue.count/2) && Int(trueValue)! % 10 == 0) else {
            return false
        }
        // 닫힌 괄호(>) 가 열린 괄호 (<) 보다 많은 경우
        for index in 0..<valueArr.count{
            if(valueArr[index] == 1) {countLeft += 1}
            if(countLeft < index + 1 - countLeft) { return false }
        }
        return true
    }
}
