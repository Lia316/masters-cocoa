//
//  Brain of RPC.swift
//  Rock Paper Scissors
//
//  Created by Lia on 2020/11/30.
//

import Foundation

class RPS_brain {
    var aiTimer = Timer()
    var randomInterval = 0.0
    var userTime = 0.0
    var randomRPS = ""
    var userRPS = ""
    var score = (win: 0, draw: 0, lose: 0)
    var gameNumber = 0
    
    func winner() -> Int {
        var winningState = 5
        if timeChecker() != 0 { return 404 }
        // 비긴 경우
        if userRPS == randomRPS {
            winningState = 0
        } else { // 이긴 경우
            switch (userRPS, randomRPS) {
            case ("🤚", "✊"):
                winningState = 1
            case ("✌️", "🤚"):
                winningState = 1
            case ("✊", "✌️"):
                winningState = 1
            default: // 진 경우
                winningState = -1
            }
        }
        return winningState
    }
    
    func timeChecker() -> Int {
        var timeState = 0
        switch userTime {
        case 0 ..< 2.0:
            timeState = -1
        case 3.5 ..< 100:
            timeState = 1
        default:
            timeState = 0
        }
        return timeState
    }

    func addScore(winner: Int) {
        switch winner {
        case -1:
            score.lose += 1
        case 0:
            score.draw += 1
        case 1:
            score.win += 1
        default:
            break
        }
        
    }
}



//            let date = Date()
//            let format = DateFormatter()
//            print(self.timeInterval)
//            print("??")
//            format.dateFormat = "y-MM-dd H:m:ss.SSSS"
//            print(format.string(from: date))
