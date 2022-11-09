//
//  RestViewController.swift
//  Original
//
//  Created by USER on 2022/10/26.
//

import UIKit

class RestViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    var count: Int = 300
    var timer: Timer = Timer()
    
    @IBAction func back(){
        
    }

    @objc func down() {
        count = count - 1
        
        let minutes = count / 60
        let seconds = count % 60
        label.text = String(format: "%02d:%02d", minutes, seconds)
        
        if count <= 0 {
            timer.invalidate()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            if !timer.isValid{
                timer = Timer.scheduledTimer(timeInterval:1,
                                             target: self,
                                             selector: #selector(self.down),
                                             userInfo: nil,
                                             repeats: true)
            }
        
        let minutes = count / 60
        let seconds = count % 60
        label.text = String(format: "%02d:%02d", minutes, seconds)
        // Do any additional setup after loading the view.
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
