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
        import UIKit
        import Lottie //①でインポート済

        class ViewController: UIViewController {

            //AnimationViewの宣言
            var animationView = AnimationView()

            override func viewDidLoad() {
                super.viewDidLoad()

                //アニメーションの呼び出し
                addAnimationView()
            }

            //アニメーションの準備
            func addAnimationView() {

                //アニメーションファイルの指定
                animationView = AnimationView(name: "tree1") //ここに先ほどダウンロードしたファイル名を記述（拡張子は必要なし）

                //アニメーションの位置指定（画面中央）
                animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)

                //アニメーションのアスペクト比を指定＆ループで開始
                animationView.contentMode = .scaleAspectFit
                animationView.loopMode = .loop
                animationView.play()

                //ViewControllerに配置
                view.addSubview(animationView)
            }
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

}
