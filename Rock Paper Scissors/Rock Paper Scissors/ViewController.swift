//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Lia on 2020/11/30.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {
    
    @IBOutlet var timeImage: UIImageView!
    @IBOutlet weak var aiRPS: UILabel!
    @IBOutlet weak var aiFace: UILabel!
    @IBOutlet var aiWin: [UILabel]!
    @IBOutlet var userWin: [UILabel]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var RPSbutton: [UIButton]!
    @IBOutlet weak var startButton: UIButton!
    
    
    var image1 : UIImage? = UIImage(named: "1.png")
    var image2 : UIImage? = UIImage(named: "2.png")
    var image3 : UIImage? = UIImage(named: "3.png")
    var image4 : UIImage? = UIImage(named: "종료!.png")
    var READYimage : UIImage? = UIImage(named: "ready.png")
    var imageFast : UIImage? = UIImage(named: "너무 일찍 냈어.png")
    var imageSlow : UIImage? = UIImage(named: "너무 늦게 냈어.png")
    var imageAgain : UIImage? = UIImage(named: "다시.png")
    
    var RPS = RPS_brain()
    private var isValid = false
    var timer = Timer()
    var time = 5
    var startTime = Date().timeIntervalSince1970
    
    // MARK: – FUNCTIONS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let viewController : MenuViewController = segue.destination as! MenuViewController
            viewController.delegate = self
        }
    }
    func sendData(data: Int) {
        RPS.gameNumber = data
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableButton()
        timeImage.image = READYimage
        print("gameNum: ", RPS.gameNumber)
        
//        _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
//            self.startButton.sendActions(for: .touchUpInside)
//        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        reset()
        timePerform()
        aiRandomRPS()
        let diff = RPS.randomInterval - 5
        print("ai time: ", RPS.randomInterval, diff)
        
    }
    
    // user의 가위바위보 state 및 time을 model에 전달
    @IBAction func RPSButton(_ sender: UIButton) {
        let rpsTime = Date().timeIntervalSince1970
        let userTime = rpsTime - startTime
        RPS.userTime = userTime
        RPS.userRPS = sender.currentTitle ?? "error"
        print("사람이 내는 가위바위보 시간 :  \(userTime)")
        print( "win: ", RPS.winner())
        print( "time: ", RPS.timeChecker())
        RPS.addScore(winner: RPS.winner())
        _ = Timer.scheduledTimer(withTimeInterval: 3.05 - userTime, repeats: false) { (timer) in
            self.showWinner()
            self.showScore()
        }
        
    }
    
    // 3 2 1 초마다 시간을 알려준다
    func timePerform() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            switch self.time {
            case 3: // 3초에 userTime을 위한 시간을 재고, 버튼을 활성화시킨다
                self.timeImage.image = self.image3
                self.startTime = Date().timeIntervalSince1970
                self.RPSbutton[0].isEnabled = true
                self.RPSbutton[1].isEnabled = true
                self.RPSbutton[2].isEnabled = true
            case 2: self.timeImage.image = self.image2
            case 1: self.timeImage.image = self.image1
            default : self.timeImage.image = self.READYimage
            }
            print("clock : ", self.time)
            self.time -= 1
            if self.time < 0 {
                timer.invalidate()
                self.timeImage.image = self.image4
            }
        }
    }
    
    // AI의 가위바위보 : 랜덤 시간, 랜덤 가위바위보
    func aiRandomRPS() {
        let randomTime = Double.random(in: 4.5...5.5)
        let randomNum = Int.random(in: 0...300) % 3
        
        // 시간 판정 및 계산을 위해 값을 model에게 넘겨준다
        RPS.randomInterval = randomTime
        switch randomNum {
        case 0: self.RPS.randomRPS = "✊"
        case 1: self.RPS.randomRPS = "🤚"
        case 2: self.RPS.randomRPS = "✌️"
        default: break
        }
        _ = Timer.scheduledTimer(withTimeInterval: randomTime + 0.9, repeats: false) { (timer) in
            self.aiRPS.text = self.RPS.randomRPS
        }
    }
    
    func showWinner() {
        switch RPS.winner() {
        case -1:
            aiFace.text = "😝"
            aiWin[0].text = "🎉"
            aiWin[1].text = "🎉"
        case 0:
            aiFace.text = "😧"
        case 1:
            aiFace.text = "😥"
            userWin[0].text = "🎉"
            userWin[1].text = "🎉"
        case 404:
            aiFace.text = "🤨"
            invalidTime()
        default:
            aiFace.text = "🤔"
        }
    }
    
    func showScore() {
        let score = RPS.score
        scoreLabel.text = String(format: "%01d 승 %01d 무 %01d 패", score.0, score.1, score.2)
    }
    
    func invalidTime() {
        var time = 5
        let state = RPS.timeChecker() == -1
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            time -= 1
            self.timeImage.image = state ? self.imageFast : self.imageSlow
            
            if time < 2 {
                self.timeImage.image = self.imageAgain
                timer.invalidate()
            }
        }
        
    }
    
    
    // 3초 전에는 가위바위보 비활성화
    func disableButton() {
        RPSbutton[0].isEnabled = false
        RPSbutton[1].isEnabled = false
        RPSbutton[2].isEnabled = false
    }
    
    // 손 흔드는 애니메이션
    func shake( _ sender: UILabel, duration: CFTimeInterval) {
        let shakeValues = [-5, 5, -5, 5, -3, 3, -2, 2, 0]

        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: .linear)
        translation.values = shakeValues
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = shakeValues.map { (.pi * Double($0)) / 180.0 }
        
        let shakeGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = duration
        sender.layer.add(shakeGroup, forKey: "shakeIt")
    }
    
    // 새로 게임을 시작할 때 load
    func reset() {
        aiRPS.text = "👋"
        aiFace.text = "🤔"
        aiWin[0].text = ""
        aiWin[1].text = ""
        userWin[0].text = ""
        userWin[1].text = ""
        RPS.userRPS = ""
        disableButton()
        timeImage.image = READYimage
        shake(aiRPS, duration: 6.4)
        time = 5
    }
}

