//
//  main.swift
//  week 1-3 #6
//
//  Created by 김지경 on 2020/11/04.
//

import Foundation

struct Diamond {
    let lines : Int
    var diamond: [[String]]
    let width : Int
    
    init( line : Int) {
        self.lines = line
        self.width = (self.lines % 2 == 1) ? self.lines : self.lines - 1
        self.diamond = Array(repeating : Array(repeating: "",count: width ), count: lines)
    }

    // lines 입력값 홀짝 구분 함수
    func checkOdd () -> Bool {
        var checkOE : Bool
        checkOE = (lines % 2 == 1) ? true : false
            
        return checkOE
    }
    
    // 진행되는 row가 전체 line의 반을 넘었는지 확인하는 함수
    // 반 넘으면 true
    func checkHalf (row : Int) -> Bool {
        var checkHF : Bool
        checkHF = (row >= (lines/2 + 1)) ? true : false
        
        return checkHF
    }
    
    // " " 개수 계산하는 함수
    func numSpace (row : Int) -> Int {

        var num : Int
                 
        if(!checkHalf(row: row)) {
            num = (width + 1)/2 - row
        }
        else {
            var mirror : Int = lines - row + 1
            num = (width + 1)/2 - mirror
        }
  
        return num
    }
    
    func numDia (row : Int) -> Int {
        var num : Int
        
        if(!checkHalf(row: row)) {
            num = 2 * row - 1
        }
        else {
            var mirror : Int = lines - row + 1
            num = 2 * mirror - 1
        }
        
        return num
    }
    
    func printDiamond () {
        var row : Int = 0

        // 행 돌리는 for문
        for _ in 1...lines {
        // 각 행마다 "" 와 *의 계산된 개수대로 반복
            row += 1
            if (numSpace(row: row) > 0) {
                // numSpace는 1 보다 작으면 오류 뜸
                for _ in 1...numSpace(row: row) {
                    print (" ", terminator : "")
                }
            }
            
            for _ in 1...numDia(row: row) {
                print("*", terminator : "")
            }
            
            if (numSpace(row: row) > 0) {
                for _ in 1...numSpace(row: row) {
                    print (" ", terminator : "")
                }
            }
            
            print("\n")
        }
    
    } // end of func
    
    // struct finish
}

var testDiamond = Diamond(line: 4)
testDiamond.printDiamond()

