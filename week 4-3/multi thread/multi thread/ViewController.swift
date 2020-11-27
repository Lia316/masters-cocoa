//
//  ViewController.swift
//  multi thread
//
//  Created by Lia on 2020/11/25.
//

import UIKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let some = BackgroundWork()
//        some.doTimeConsumingOperation(operation: nil)
//    }
//
//
//
//}


class ViewController : UIViewController {
 
         // Declare two threads
    var thread_1: Thread?
    var thread_2: Thread?
 
         // Create two NSCondition
    let condition_1 = NSCondition()
    let condition_2 = NSCondition()
 
    override func viewDidLoad() {
        super.viewDidLoad()
                 //Two thread creation and thread_1 startup
        thread_1 = Thread(target: self, selector: #selector(self.forThreadOne) , object: nil)
        thread_2 = Thread(target: self, selector: #selector(self.forThreadTwo), object: nil)
        thread_1?.start()
    }
 
         //thread_1 method to be executed
    @objc func forThreadOne() {
        for i in 1...7 {
            print("Thread_1 is running for the #\(i) time(s).")
            if i % 2 == 0 {
                                 // Determine whether thread_2 is running, start it when it is not running, if it is running, signal wake up thread_2
                if thread_2!.isExecuting {
                    condition_2.signal()
                } else {
                    thread_2?.start()
                }
                                 //Lock thread_1
                condition_1.lock()
                condition_1.wait()
                condition_1.unlock()
            }
        }
        print("Thread_1 says it is ended.")
 
    }
 
         //thread_2 method to be executed
    @objc func forThreadTwo() {
        for i in 1...7 {
            print("Thread_2 is running for the #\(i) time(s).2")
            if i % 2 == 0 {
                                 // signal wake up thread_1
                condition_1.signal()
                                 //Lock thread_2
                condition_2.lock()
                condition_2.wait()
                condition_2.unlock()
            }
        }
        print("Thread_2 says it is over.")
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


class BackgroundWork {
    var thread : Thread? = nil
    
    func doTimeConsumingOperation(operation : Any?) {
        thread = Thread(target: self,
                   selector: #selector(BackgroundWork.runHelper), object: operation)
        thread?.start()
    }
    
    @objc func runHelper(operation : Any?) {
        autoreleasepool { () in
            //operation.doOperation()
            print("Other thread is running...")
        }
    }
}

func something() {
    let some = BackgroundWork()
    some.doTimeConsumingOperation(operation: nil)
}
