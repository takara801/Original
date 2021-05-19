//
//  TimerViewController.swift
//  Original
//
//  Created by USER on 2021/02/03.
//


import UIKit

class ViewController: UIViewController {

    @IBAtion func bake() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func up() {
        count = count + 0.01
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute,.hour,.second]
        let outputString = formatter.string(from: count)
        
        
        label.text = outputString

    }

    @IBAction func start () {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    @IBAction func stop() {
            if timer.isValid {
                timer.invalidate()
            }
        
    }
    
    
}
