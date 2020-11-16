//
//  ViewController.swift
//  Waiting Number
//
//  Created by Lia on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOulets
    @IBOutlet weak var discriptionLable: UILabel!
    @IBOutlet weak var waitNumberLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var waitingRegulator = Waiting()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func waitButtonPressed(_ sender: UIButton) {
        count += 1
        waitingRegulator.validateLimit(waitingNum: count)
        updateUI()
    }
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        count -= 1
        waitingRegulator.validateLimit(waitingNum: count)
        updateUI()
    }
    
    func updateUI(){
        waitNumberLable.backgroundColor = waitingRegulator.waitingColor
        waitNumberLable.text = waitingRegulator.peopleNum
        progressBar.backgroundColor = waitingRegulator.barColor
        progressBar.progress = waitingRegulator.barPercent
    }
}

struct Waiting{
    var peopleNum : String = "00 명"
    var waitingColor : UIColor = .systemBackground
    var barColor : UIColor = .systemBlue
    var barPercent : Float = 0
    
    mutating func validateLimit(waitingNum : Int) {
        if(waitingNum == 20){
            waitingColor = .red
            barColor = .red
        }
        barPercent = 0.05 * Float(waitingNum)
        if(waitingNum < 10){
            peopleNum = "0" + String(waitingNum) + " 명"
        }
        else{
            peopleNum = String(waitingNum) + " 명"
        }
    }
    
}
