//
//  Brain of Watch.swift
//  Hangeul Watch
//
//  Created by Lia on 2020/11/23.
//

import Foundation

class WatchBrain {
    var calendar = Calendar.current
    var date = Date()
    var text = [String]()
    var time = (hour: 0, minute: 0, second: 0)

    let hangeulNum = [
        0: "영", 1: "한", 2: "두", 3: "세", 4: "네", 5: "다섯",6: "여섯",
        7: "일곱", 8: "여덟", 9: "아홉", 10: "열", 11: "열한", 12: "열두"]
    
    let chineaseNum = [
        1: "일", 2: "이", 3: "삼", 4: "사", 5: "오",
        6: "육", 7: "칠", 8: "팔", 9: "구", 10: "십", 0: ""]
    
    func timeUpdate(){
        date = Date()
          print(date)
        
        time = (hour: calendar.component(.hour, from: date), minute: calendar.component(.minute, from: date), second: calendar.component(.second, from: date))
//
//        text = "\(time.hour)시 \(time.minute)분 \(time.second)초"
    }
    
    func convertString() {
        let noon = time.hour <= 11 ? "오전" : "오후"
        let hours = time.hour <= 12 ? hangeulNum[time.0]! : hangeulNum[time.0 - 12]!
        let minutes = chineaseConverter(num: time.minute)
        let seconds = chineaseConverter(num: time.second)
        let dayNight = time.hour >= 7 && time.0 < 19 ? "☀️" : "🌙"
        
        text = [noon, hours, minutes, seconds, dayNight]
        
    }

    func chineaseConverter(num : Int) -> String {
        var resultString : String
        
        if(num <= 10){
            resultString = chineaseNum[num]!
        } else if (num < 20){
            resultString = "십\(chineaseNum[num % 10]!)"
        } else {
            resultString = "\(chineaseNum[num / 10]!)십\(chineaseNum[num % 10]!)"
        }
        return resultString
    }
    

}


//enum Time {
//    case Noon((Int) -> String)
//    case Hours((Int) -> String)
//    case Minutes((Int) -> String)
//    case Seconds((Int) -> String)
//    case Daynight((Int) -> String)
//}
