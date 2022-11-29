//
//  CalendarViewController.swift
//  Original
//
//  Created by USER on 2022/11/16.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController, FSCalendarDataSource ,FSCalendarDelegate ,FSCalendarDelegateAppearance {
    
    func stringFromDate(date: Date, format: String) -> String{
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    let realm  = try! Realm()
    @IBOutlet  weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let userData = realm.objects(Memo.self)
//        print("🟥全てのデータ\(userData)")
        
//        let calendar = FSCalendar(frame: CGRect(x: 50, y: 200, width: 320, height: 300))
           calendar.dataSource = self
           calendar.delegate = self
//           view.addSubview(calendar)
           calendar.appearance.calendar.firstWeekday = 1 // 月曜日からに変更
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let date = stringFromDate(date: date, format: "yyyy/MM/dd")
        let memoDates = realm.objects(Memo.self)
        var studyDays = [String:Int]()
        for study in memoDates{
            if studyDays[study.hizuke] == nil{
                studyDays[study.hizuke] = study.time
            }else{
                let newValue = studyDays[study.hizuke]! + study.time
                studyDays.updateValue(newValue, forKey: study.hizuke)
            }
        }
        
        if studyDays[date] != nil{
            if studyDays[date]! > 10{
                return UIColor.green//2時間以上
            }else if studyDays[date]! > 5{
                return UIColor.red//1時間以上
            }else if studyDays[date]! > 2{
                return UIColor.blue//1時間以上
            }else{
                return nil
            }
        } else {
            return nil
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

}
