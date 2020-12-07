//
//  MenuViewController.swift
//  Rock Paper Scissors
//
//  Created by Lia on 2020/12/04.
//

import UIKit

protocol SendDataDelegate {
    func sendData (data: Int)
}

class MenuViewController: UIViewController {
    var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = ViewController()
        print("~~~")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func gameNumber(_ sender: Any) {
        let gameNum = ["단판승부": 1, "3판2선승": 3, "5판3선승": 5, "7판4선승": 7]
        let data = gameNum[(sender as AnyObject).currentTitle ?? ""] ?? -1
        delegate?.sendData(data: data)
        dismiss(animated: true, completion: nil)
        print(gameNum[(sender as AnyObject).currentTitle ?? ""] ?? -1)
        print(data)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
