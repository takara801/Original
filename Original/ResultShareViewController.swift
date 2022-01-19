//
//  ResultShareViewController.swift
//  Original
//
//  Created by USER on 2021/11/03.
//


import UIKit

class ResultShareViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        let resultSaveViewController:ResultSaveViewController = segue.destination as! ResultSaveViewController; resultSaveViewController.timeCount = Int(self.timeCount)
            mokuhyou = mokuhyouLabel.text
            resultSaveViewController.mokuhyou = self.mokuhyou
    }
    
    var timeCount: Int!
    var mokuhyou: String!
    @IBOutlet var time: UILabel!
    @IBOutlet var mokuhyouLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hours = timeCount / 3600
        let minutes = (timeCount % 3600) / 60
        let seconds = timeCount % 60
        
        time.text = String(format: "%02d:%02d:%02d%", hours, minutes, seconds)
        mokuhyouLabel.text = mokuhyou
        
        // Do any additional setup after loading the view.
    }
   
    
    /**
    * @brief  スクリーンショットを取得する
    * @return UIImage
    */
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
    
    @IBAction func Twittew () {
    
    // スクリーンショットを取得
        let shareImage = getScreenShot().pngData()
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
    
    
    
    
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
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
