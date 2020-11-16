//
//  matrix.swift
//  week 3-1
//
//  Created by Lia on 2020/11/16.
//

import Foundation

class Matrix {
    var a : Double
    var b : Double
    var c : Double
    var d : Double
    
    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix{
        return Matrix(a: self.a + other.a, b: self.b + other.b, c: self.c + other.c, d: self.d + other.d)
    }
    
    func product(with other: Matrix) -> Matrix{
        return Matrix(a: self.a * other.a + self.b * other.c, b: self.a * other.b + self.b * other.d, c: self.c * other.a + self.d * other.c, d: self.c * other.b + self.d * other.d)
    }
}
