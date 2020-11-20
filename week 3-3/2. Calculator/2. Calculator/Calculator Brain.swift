//
//  Calculator Brain.swift
//  2. Calculator
//
//  Created by Lia on 2020/11/19.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    private var stack : [Double] = []
    
    var operations : Dictionary<String, Operation> = [
        "+": Operation.BinaryOperation{ $0 + $1 },
        "-": Operation.BinaryOperation{ $0 - $1 },
        "×": Operation.BinaryOperation{ $0 * $1 },
        "÷": Operation.BinaryOperation{ $0 / $1 },
        "=": Operation.Equal
    ]
    
    enum Operation {
        case BinaryOperation((Double, Double) -> Double)
        case Equal
    }
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    struct Temp {
        var function : ((Double, Double) -> Double)
        var accumulated : Double
    }
    
    private var storedProperty : Temp?
    
    func performOperation(symbol : String) {
        switch operations[symbol] {
        case .BinaryOperation(let function) :
            storedProperty = Temp(function: function, accumulated: accumulator)
        case .Equal :
            if storedProperty != nil {
                accumulator = storedProperty!.function(storedProperty!.accumulated, accumulator)
                storedProperty = nil
            }
        default:
            break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
