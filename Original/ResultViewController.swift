//
//  ResultViewController.swift
//  Original
//
//  Created by USER on 2021/02/10.
//

import UIKit
import Lottie //Lottieのインポート

class ResultViewController: UIViewController,UITextFieldDelegate {
    
    let UD = UserDefaults.standard

    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
       
        if segue.identifier == "toSave" {
            let resultSaveViewController:ResultSaveViewController = segue.destination as! ResultSaveViewController; resultSaveViewController.timeCount = Int(self.timeCount)
                resultSaveViewController.mokuhyou = self.mokuhyou
            }
        
        if segue.identifier == "toRest" {
            let RestViewController:RestViewController = segue.destination as! RestViewController;
                RestViewController.count = self.restTime

            }
    }
    
        
    @IBOutlet var mokuhyouLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
//    @IBOutlet var treeImageView: UIImageView!
    
    @IBAction func fin (){
//        performSegue(withIdentifier: "toShare", sender: nil)
        
        animationView.pause()
        if timer.isValid {
                //タイマーが動作していたら停止する
                timer.invalidate()
        }
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "お疲れ様でした！", message: "成果をSNSで発信しますか？", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
            UIAlertAction(
                title: "はい",
                style: .default,
                handler: {action in
                    //ボタンが押された時の動作
//                    self.performSegue(withIdentifier: "toShare", sender: nil)
                    
                    // スクリーンショットを取得
                    let shareImage = self.getScreenShot().pngData()
                    // 共有項目
                    let activityItems: [Any] = [shareImage!, "今日の成果！"]
                    // 初期化処理
                    let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

                    // iPad用処理
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        activityVC.popoverPresentationController?.sourceView = self.view
                        activityVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
                    }

                    // UIActivityViewControllerを表示
                    self.present(activityVC, animated: true, completion: nil)
                }
            )
        )
        
        //キャンセルボタン
        alert.addAction(
            UIAlertAction(
                title: "いいえ",
                style: .cancel,
                handler: {action in
//                    ボタンが押された時の動作
                    self.performSegue(withIdentifier: "toSave", sender: nil)
                }
            )
        )
        
    present(alert,animated: true,completion: nil)

    }
        
 
    var mokuhyou: String!
    var restTime: Int = 300
    var timeCount: Int = 0
    var timer: Timer = Timer()
    //AnimationViewの宣言
    var animationView = AnimationView()
    
    
    func getScreenShot()-> UIImage {
        // キャプチャ範囲を決定
        let width = Int(UIScreen.main.bounds.size.width)  //画面横幅いっぱい
        let height = 100
        let size = CGSize(width: width, height: height)
        // ビットマップ画像のcontextを作成
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 対象のview内の描画をcontextに複写する.
        self.view.layer.render(in: context)
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // contextを閉じる.
        UIGraphicsEndImageContext()
        return capturedImage
    }
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.hidesBackButton = true
        
        mokuhyouLabel.text = mokuhyou
        
        //アニメーションの呼び出し
        addAnimationView(timeIndex: 0)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
       
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        view.endEditing(true)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }

   
    
    //タイマーを開始するメソッド
    @IBAction func start () {
        
        self.navigationItem.hidesBackButton = true
        
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
        
        let changetimeArray = [0,600,1800,3600,6000,8400,11400]
        
        if let timeIndex = changetimeArray.firstIndex(of: timeCount){
            animationView.removeFromSuperview()
            addAnimationView(timeIndex: timeIndex)
            animationView.contentMode = .scaleAspectFill
            animationView.loopMode = .loop
            animationView.play()
        }
            
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
        animationView = AnimationView(name: "bud")
        //ここに先ほどダウンロードしたファイル名を記述（拡張子は必要なし）
        if timeCount == 600 {
            animationView = AnimationView(name: "tiny_branch")
        }else if timeCount == 1800 {
            animationView = AnimationView(name: "branch")
        }else if timeCount == 3600 {
            animationView = AnimationView(name: "large_branch")
        }else if timeCount == 6000 {
            animationView = AnimationView(name: "tree")
        }else if timeCount == 8400 {
            animationView = AnimationView(name: "big_tree")
        }else if timeCount == 11400 {
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
    
   
    
    //アニメーションの準備
    //アニメーションの準備
        func addAnimationView(timeIndex: Int) {

            //アニメーションファイルの指定
            let filenameArray = ["bud","tiny_branch","branch","large_branch","tree","big_tree","large_tree"]
            let widthArray = [100.0,150.0,150.0,210.0,210.0,320.0,360.0]
            let heightArray = [100.0,150.0,180.0,230.0,230.0,350.0,400.0]
            
            
            animationView = AnimationView(name: filenameArray[timeIndex])
            
            
            let width = widthArray[timeIndex]
            let height = heightArray[timeIndex]
            let viewHeight = view.frame.size.height
            let x = (view.frame.size.width -  width)/2
            let y = 47 * viewHeight/60 - height

            //アニメーションの位置指定（画面中央）
            animationView.frame = CGRect(x: x, y: y, width: width, height: height)


            //ViewControllerに配置
            view.addSubview(animationView)
        }


}
