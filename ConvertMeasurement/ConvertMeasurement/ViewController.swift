//
//  ViewController.swift
//  ConvertMeasurement
//
//  Created by 김지경 on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var InputMeasurement: UITextField!
    @IBOutlet weak var printResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func convertMeasurement(_ sender: Any) {
        let input = Double(InputMeasurement.text ?? "")
        
        var someValue = Measurement(value: input ?? 0, unit: UnitLength.feet)
        someValue.convert(to: UnitLength.meters)
        
        printResult.text = "result = \(someValue)"
    }
}

