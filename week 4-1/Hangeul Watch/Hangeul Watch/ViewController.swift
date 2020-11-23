//
//  ViewController.swift
//  Hangeul Watch
//
//  Created by Lia on 2020/11/23.
//

import UIKit


class ViewController: UIViewController {
 
    var timer = Timer()
    private var brain = WatchBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var timerText: UILabel!
    
    @IBOutlet var noon: [UILabel]!
    @IBOutlet var hours: [UILabel]!
    @IBOutlet weak var dayNight: UILabel!
    @IBOutlet var minutes: [UILabel]!
    @IBOutlet weak var seconds: UILabel!
    
    
    @IBAction func starTimer(sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            (timer) in
            self.UIupdate()
        }
    }
    

    @IBAction func finishTimer(sender: UIButton) {
        timer.invalidate()
    }
    
    
    func UIupdate() {
        brain.timeUpdate()
        brain.convertString()
        timerText.text = "\(brain.text[0]) \(brain.text[1])시 \(brain.text[2])분 \(brain.text[3])초 \(brain.text[4])"
        
        dayNight.text = brain.text[4]
        seconds.text = brain.text[3] == "" ? "정각" : "\(brain.text[3])초"
        
        if brain.text[0].contains(Character(noon[0].text ?? "")) {
            noon[0].textColor = .systemBackground
        } else {
            noon[1].textColor = .systemBackground
        }
        
        for index in 0...14 {
            if brain.text[1].contains(Character(hours[index].text ?? "")) {
                hours[index].textColor = .systemBackground
            }
        }
        for index in 0...13 {
            if brain.text[2].contains(Character(minutes[index].text ?? "")) {
                minutes[index].textColor = .systemBackground
            }
        }
    }
 
}
 
