//
//  ViewController.swift
//  Original
//
//  Created by USER on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let oval = UIBezierPath(ovalIn: CGRect(x: 100, y: 200, width: 200, height: 100))
        // 内側の色
        UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.3).setFill()
        // 内側を塗りつぶす
        oval.fill()
        // 線の色
        UIColor(red: 0, green: 0.5, blue: 1, alpha: 1.0).setStroke()
        // 線の太さ
        oval.lineWidth = 2.0
        // 線を塗りつぶす
        oval.stroke()
        
//        let drawView = DrawView(frame: self.view.bounds)
//        self.view.addSubview(drawView)
        
    }

    @IBOutlet var start:UILabel!
    
    @IBAction func go (){
        performSegue(withIdentifier: "toView", sender: nil)
        
       // go.layer.cornerRadius = 100
    }
    
    
}


//class DrawView: UIView {
// 
//    override init(frame: CGRect) {
//        super.init(frame: frame);
//        self.backgroundColor = UIColor.clear;
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func draw(_ rect: CGRect) {
//        
//        // ここにUIBezierPathを記述する
//        
//        // 楕円
//        let oval = UIBezierPath(ovalIn: CGRect(x: 100, y: 200, width: 200, height: 100))
//        // 内側の色
//        UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.3).setFill()
//        // 内側を塗りつぶす
//        oval.fill()
//        // 線の色
//        UIColor(red: 0, green: 0.5, blue: 1, alpha: 1.0).setStroke()
//        // 線の太さ
//        oval.lineWidth = 2.0
//        // 線を塗りつぶす
//        oval.stroke()
//        
//    }
// 
//}
