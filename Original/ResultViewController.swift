//
//  ResultViewController.swift
//  Original
//
//  Created by USER on 2021/02/10.
//

import UIKit
import Lottie //Lottieのインポート

class ResultViewController: UIViewController,UITextFieldDelegate {
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        let resultShareViewController:ResultShareViewController = segue.destination as! ResultShareViewController; resultShareViewController.timeCount = Int(self.timeCount)
            mokuhyou = mokuhyouTextField.text 
            resultShareViewController.mokuhyou = self.mokuhyou
    }
    
    
    @IBOutlet var mokuhyouTextField: UITextField!
    @IBOutlet var countLabel: UILabel!
//    @IBOutlet var treeImageView: UIImageView!
    
    @IBAction func fin (){
        performSegue(withIdentifier: "toShare", sender: nil)
    }
        
    var mokuhyou: String!
    var timeCount: Int = 0
    var timer: Timer = Timer()
    //AnimationViewの宣言
    var animationView = AnimationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mokuhyouTextField.placeholder = "目標を入力 "
        //アニメーションの呼び出し
        addAnimationView()
        mokuhyouTextField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    //タイマーを開始するメソッド
    @IBAction func start () {
        
        print("Timing started!")
        animationView.play()
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
                                        )
        }
    }
    
    //タイマーのカウントのメソッド
    @objc func up() {
        timeCount = timeCount + 1
        
        let hours = timeCount / 3600
        let minutes = (timeCount % 3600) / 60
        let seconds = timeCount % 60
        countLabel.text = String(format: "%02d:%02d:%02d%", hours, minutes, seconds)
        
        changeImage()
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
    }
    
    
    //タイマーを停止するメソッド
    @IBAction func pause() {
        animationView.pause()
        if timer.isValid {
                //タイマーが動作していたら停止する
                timer.invalidate()
        }
    }
    
    @IBAction func reset(){
        timer.invalidate() //timerの停止
        timeCount = 0 //countの初期化
        countLabel.text = String(timeCount)
    }
    
    //アニメーションの準備
    func addAnimationView() {

        //アニメーションファイルの指定
        animationView = AnimationView(name: "bud") //ここに先ほどダウンロードしたファイル名を記述（拡張子は必要なし）

        if timeCount == 5 {
            animationView = AnimationView(name: "tiny_branch")
        }else if timeCount == 10 && timeCount > 5 {
            animationView = AnimationView(name: "branch")
        }else if timeCount == 15 && timeCount > 10 {
            animationView = AnimationView(name: "large_branch")
        }else if timeCount == 20 && timeCount > 15 {
            animationView = AnimationView(name: "tree")
        }else if timeCount == 25 && timeCount > 20 {
            animationView = AnimationView(name: "big_tree")
        }else if timeCount == 30 && timeCount > 25 {
            animationView = AnimationView(name: "large_tree")
        }
    

        
        //アニメーションの位置指定（画面中央）
        animationView.frame = CGRect(x: 50, y: 160, width: view.frame.size.width/1.5, height: view.frame.size.height/2)

        //アニメーションのアスペクト比を指定＆ループで開始
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.play()

        //ViewControllerに配置
        view.addSubview(animationView)
    }
    
   
    
    func changeImage(){
        if timeCount == 10 || timeCount == 15 || timeCount == 20{
            animationView.removeFromSuperview()
            addAnimationView()
            
        }
//     if count <= 10 {
//
//      }else if count <= 15 && count > 10 {
//        treeImageView.image = UIImage(named: "tree2")
//      }else if count <= 20 && count > 15 {
//        treeImageView.image = UIImage(named: "tree3")
//      }else if count <= 25 && count > 20 {
//        treeImageView.image = UIImage(named: "tree1")
//      }else if count <= 30 && count > 25 {
//        treeImageView.image = UIImage(named: "tree2")
//      }else if count <= 35 && count > 30 {
//        treeImageView.image = UIImage(named: "tree3")
//    }
//}
    
    
    
    
}


}
