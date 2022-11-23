//
//  CalendarViewController.swift
//  Original
//
//  Created by USER on 2022/11/16.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    let realm  = try! Realm()
    @IBOutlet  weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let userData = realm.objects(Memo.self)
//        print("🟥全てのデータ\(userData)")
        
        let calendar = FSCalendar(frame: CGRect(x: 50, y: 200, width: 320, height: 300))
           calendar.dataSource = self
           calendar.delegate = self
//           view.addSubview(calendar)
           calendar.appearance.calendar.firstWeekday = 1 // 月曜日からに変更
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
