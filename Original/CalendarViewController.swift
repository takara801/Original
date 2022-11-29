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
            if studyDays[date]! > 8{
                return UIColor(red: 0.125, green: 0.376, blue: 0.306, alpha: 1.0)//2時間以上
            }else if studyDays[date]! > 7{
                return UIColor(red: 0.114, green: 0.455, blue: 0.372, alpha: 1.0)//1時間以上
            }else if studyDays[date]! > 6{
                return UIColor(red: 0.047, green: 0.584, blue: 0.478, alpha: 1.0)//1時間以上
            }else if studyDays[date]! > 5{
                return UIColor(red: 0.329, green: 0.725, blue: 0.478, alpha: 1.0)//1時間以上
            }else if studyDays[date]! > 4{
                return UIColor(red: 0.419, green: 0.792, blue: 0.514, alpha: 1.0)
            }else if studyDays[date]! > 3{
                    return UIColor(red: 0.560, green: 0.820, blue: 0.310, alpha: 1.0)
            }else if studyDays[date]! > 2{
                return UIColor(red: 0.808, green: 0.906, blue: 0.255, alpha: 1.0)
            }else if studyDays[date]! > 1{
                return UIColor(red: 0.902, green: 0.976, blue: 0.529, alpha: 1.0)
            }else if studyDays[date]! > 0{
                return UIColor(red: 0.965, green: 0.941, blue: 0.694, alpha: 1.0)
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
