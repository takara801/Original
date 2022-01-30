//(defrule RECORDER::<#Rule name#>
// (table (table-id ?output) (side append))
// (table-attribute (table-id ?output) (has schema <#schema name#>))
// <#Conditions#>
// =>
// (create-new-row ?output)
// (set-column <#mnemonic#> <#expression#>)
//)//
//  ResultRelmeViewController.swift
//  Original
//
//  Created by USER on 2022/01/19.
//

import UIKit
import RealmSwift

class ResultRealmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userData = realm.objects(Memo.self)
        print("🟥全てのデータ\(userData)")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonAction(_ sender: Any){
        let memo = Memo()
        memo.name = textField1.text!
        memo.age = Int(textField2.text!)!
        try! realm.write {
            realm.add(memo)
        }
        
        textField1.text = ""
        textField2.text = ""
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let memoData = realm.objects(Memo.self)
        cell.textLabel!.text = "\(memoData[indexPath.row].name)さん"
        cell.detailTextLabel!.text = String("\(memoData[indexPath.row].age)歳")
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


