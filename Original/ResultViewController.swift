//
//  ResultViewController.swift
//  Original
//
//  Created by USER on 2021/02/10.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var treeImageView: UILabel!
    
    var count: Int = 0
    
    var timer: Timer = Timer()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func up() {
        count = count + 1
        
        let hours = count / 3600
                let minutes = (count % 3600) / 60
                let seconds = count % 60
                countLabel.text = String(format: "%02d:%02d:%02d%", hours, minutes, seconds)
    }

    @IBAction func start () {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        if count >=10 {
            treeImageView.image = UIImage(name: "tree1")
        }else if count >=15{
            treeImageView.image = UIImage(name: "tree2")
        }else if count >=20{
            treeImageView.image = UIImage(name: "tree3")
        }else if count >=25{
            treeImageView.image = UIImage(name: "tree4")
        }else if count >=30{
            treeImageView.image = UIImage(name: "tree5")
        }else if count >=35{
            treeImageView.image = UIImage(name: "tree6")
        }
    }

    
    @IBAction func stop() {
            if timer.isValid {
                timer.invalidate()
            }
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}

