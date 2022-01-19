    (defrule RECORDER::<#Rule name#>
     (table (table-id ?output) (side append))
     (table-attribute (table-id ?output) (has schema <#schema name#>))
     <#Conditions#>
     =>
     (create-new-row ?output)
     (set-column <#mnemonic#> <#expression#>)
    )//
//  ResultRelmeViewController.swift
//  Original
//
//  Created by USER on 2022/01/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var ableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 15
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
        }
        
        // Do any additional setup after loading the view.
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
