//
//  main.swift
//  1. bracket
//
//  Created by Lia on 2020/11/18.
//

import Foundation

let test1 = ValidMatch(type: .curly)
print(test1.bracket)
print(test1.generate(with: 4))

print(test1.analyze(with: "100110"))
print(test1.generate(with: 4).count)
print(test1.generate(with: 5).count)
print(1, test1.analyze(with: "{}"))


