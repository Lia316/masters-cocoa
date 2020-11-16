//
//  special binary.swift
//  week 3-1
//
//  Created by Lia on 2020/11/16.
//

import Foundation

struct Binary {
    let total : Int
    var value : [String]
    var count : Int

    init(with total : Int){
        self.total = total
        self.count = Int(pow(2, Double(total)))
        self.value = [String(repeating: "0", count: total)]
        
        for index in 1..<count{
            self.value.append(String(repeating: "0", count: total - Int(log2(Double(index))) - 1) + String(index, radix: 2))
        }
    }
        
    func find(by bitcount: Int) -> Array<String> {
        var bitArray = [String]()
        
        for binary in value {
            let array = Array(binary.map{Int(String($0))!})
            if (array.reduce(0){$0 + $1} == 3){
                bitArray.append(binary)
            }
        }
        
        return bitArray
    }
}
