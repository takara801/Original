//
//  ResultViewController.swift
//  Original
//
//  Created by USER on 2021/02/10.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var treeImageView: UIImageView!
    
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
        
        changeImage()
        
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
       
    }

    
    @IBAction func stop() {
            if timer.isValid {
                timer.invalidate()
            }
    }
    
   
    func changeImage(){
    
     if count <= 10 {
        treeImageView.image = UIImage(named: "tree1")
      }else if count <= 15 && count > 10 {
        treeImageView.image = UIImage(named: "tree2")
      }else if count <= 20 && count > 15 {
        treeImageView.image = UIImage(named: "tree3")
      }else if count <= 25 && count > 20 {
        treeImageView.image = UIImage(named: "tree1")
      }else if count <= 30 && count > 25 {
        treeImageView.image = UIImage(named: "tree2")
      }else if count <= 35 && count > 30 {
        treeImageView.image = UIImage(named: "tree3")
    }
}
    
    
    
    
}

