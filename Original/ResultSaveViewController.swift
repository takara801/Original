//
//  ResultSaveViewController.swift
//  Original
//
//  Created by USER on 2021/11/17.
//

import UIKit
import RealmSwift

class ResultSaveViewController: UIViewController {

    let realm  = try! Realm()
    
    var timeCount: Int!
    var mokuhyou: String!
    var date: String!
    
    @IBOutlet var kamokuTextField: UITextField!
    @IBOutlet var time: UILabel!
    @IBOutlet var mokuhyouLabel: UILabel!
    @IBOutlet var hizukeLabel:UILabel!
//    @IBOutlet var contentTextView:UITextView!
    @IBOutlet var jikann: UILabel!
//    @IBOutlet var memo: UILabel!
    
    @IBAction func backToTop() {
        navigationController?.popToRootViewController(animated: true)
    }

    
    @IBAction func addButtonAction(_ sender: Any){
        let memo = Memo()
        memo.time = time.text!
        memo.hizuke = hizukeLabel.text!
//        memo.content = contentTextView.text!
        
        try! realm.write {
            realm.add(memo)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        let memo: Memo? = read()
        
        let memoData = realm.objects(Memo.self)
        print("🟥全てのデータ\(memoData)")

        
        hizukeLabel.text = Date().hizukeFormat
        time.text = memo?.time
//        jikann.text = memo?.jikann
//        contentTextView.text = memo?.content
        
        let hours = timeCount / 3600
        let minutes = (timeCount % 3600) / 60
        let seconds = timeCount % 60
        
        time.text = String(format: "%02d:%02d:%02d%", hours, minutes, seconds)
        mokuhyouLabel.text = mokuhyou
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save(_ sender: Any) {
        let memo = Memo()
        memo.time = time.text!
        memo.hizuke = hizukeLabel.text!
        try! realm.write {
            realm.add(memo)
        }
        
        let formatter = DateFormatter()
            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
            print(formatter.string(from: Date()))
        
//        let mokuhyou: String = mokuhyou
        let hizuke: String = formatter.string(from: Date())
        let label: String = time.text!
//        let content: String = contentTextView.text!
//        ?        contentTextView.text = ""
    
    
    if memo != nil {
        try! realm.write {
           
            memo.hizuke = hizuke
            memo.time = label
//            memo!.content = content
        }
    } else {
        let newMemo = Memo()
        newMemo.hizuke = hizuke
        newMemo.time = time.text!
        
        try! realm.write {
            realm.add(newMemo)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
        
        let alert: UIAlertController = UIAlertController(title: "お疲れ様です！", message:"保存しました", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: { action in self.navigationController?.popToRootViewController(animated: true)})
        )
        present(alert, animated: true, completion: nil)
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
