//
//  P4 - residentNum.swift
//  week 2-1
//
//  Created by Lia on 2020/11/09.
//

import Foundation

func residentNum() -> Bool {
    let arr = Array(readLine()!).map{ Int(String($0))! }
    var checkBool = false
    var calculate = arr[0]*2 + arr[1]*3 + arr[2]*4 + arr[3]*5 + arr[4]*6 + arr[5]*7 + arr[6]*8 + arr[7]*9 + arr[8]*2 + arr[9]*3 + arr[10]*4 + arr[11]*5
    
    calculate %= 11
    if((11 - calculate) % 10 == arr[12]) {
        checkBool = true
    }
    return checkBool
}
