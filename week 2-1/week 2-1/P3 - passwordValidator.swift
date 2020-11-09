//
//  P3 - passwordValidator.swift
//  week 2-1
//
//  Created by Lia on 2020/11/09.
//

import Foundation

func passwordValidator(password:String) -> Int {
    
    var level = 0
    let arr  = password.utf16.map{ Int($0) }
    var criterion = (numbers: false, english: false, length: false, specialChar: false)
    
    // 8글자 미만, 이상
    if(arr.count >= 8){
        criterion.length = true
    }
    for index in 0..<arr.count {
        // 숫자 포함 여부
        if(arr[index] >= 48 && arr[index] <= 57) {
            criterion.numbers = true
        }// 영문자 포함 여부
        else if((arr[index] >= 65 && arr[index] <= 90) || (arr[index] >= 97 && arr[index] <= 122)){
            criterion.english = true
        }// 특수문자 포함 여부
        else if(arr[index] >= 33 && arr[index] <= 126){ // 앞에 조건들 때문에 넓은 범위도 괜찮
            criterion.specialChar = true
        }
    }
    
    // level case
    switch criterion {
    case (true, false, false, false):
        level = 1
    case(false, true, false, false):
        level = 2
    case(true, true, true, false):
        level = 4
    case(true, true, true, true):
        level = 5
    default:
        level = 3
    }
    
    return level
}
