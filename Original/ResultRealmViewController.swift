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
    
    var timeCount: Int!
    
    var mokuhyou: String!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userData = realm.objects(Memo.self)
        print("🟥全てのデータ\(userData)")
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memoData = realm.objects(Memo.self)
        return memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let memoData = realm.objects(Memo.self)
        cell.textLabel!.text = "\(memoData[indexPath.row].hizuke)"
        cell.detailTextLabel!.text = String("\(memoData[indexPath.row].time)")
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


