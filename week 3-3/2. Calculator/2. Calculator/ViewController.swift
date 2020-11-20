//
//  ViewController.swift
//  2. Calculator
//
//  Created by Lia on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInMiddleOfTyping  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle ?? ""
        if userIsInMiddleOfTyping {
            let textCurrentlyInDisplay = display.text ?? ""
            display.text = textCurrentlyInDisplay + digit
        } else{
            display.text = String(Double(digit)!)
        }
        userIsInMiddleOfTyping = true
    }
    
    // 그냥 부르면, Double 로 형변환 , Double 값을 주면 String 으로 형변환
    private var displayValue : Double {
        get {
            return Double(display.text ?? "0")!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInMiddleOfTyping = false
        }
                
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    
}

