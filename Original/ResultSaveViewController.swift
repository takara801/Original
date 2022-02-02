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
    
    @IBOutlet var label: UILabel!
    @IBOutlet var mokuhyouLabel: UILabel!
    @IBOutlet var hizukeTextField:UITextField!
    @IBOutlet var contentTextView:UITextView!
    @IBOutlet var jikann: UILabel!
    @IBOutlet var memo: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        let resultRealmViewController:ResultRealmViewController = segue.destination as! ResultRealmViewController; resultRealmViewController.timeCount = Int(self.timeCount)
            mokuhyou = mokuhyouLabel.text
            resultRealmViewController.mokuhyou = self.mokuhyou
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memo: Memo? = read()
        
        mokuhyouLabel.text = memo?.mokuhyou
        hizukeTextField.text = memo?.hizuke
        label.text = memo?.label
//        jikann.text = memo?.jikann
        contentTextView.text = memo?.content
        
        
        
        let hours = timeCount / 3600
        let minutes = (timeCount % 3600) / 60
        let seconds = timeCount % 60
        
        label.text = String(format: "%02d:%02d:%02d%", hours, minutes, seconds)
        mokuhyouLabel.text = mokuhyou
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save() {
        let mokuhyou: String = mokuhyou
        let hizuke: String = hizukeTextField.text!
        let label: String = label.text!
        let content: String = contentTextView.text!
        
        hizukeTextField.text = ""
        contentTextView.text = ""
        
    
    let memo: Memo? = read()
    
    if memo != nil {
        try! realm.write {
            memo!.mokuhyou = mokuhyou
            memo!.hizuke = hizuke
            memo!.label = label
            memo!.content = content
        }
    } else {
        let newMemo = Memo()
        newMemo.mokuhyou = mokuhyou
        newMemo.hizuke = hizuke
        newMemo.label = label
        newMemo.content = content
        
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
