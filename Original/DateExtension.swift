//
//  DateExtension.swift
//  Original
//
//  Created by USER on 2022/07/06.
//

import Foundation

extension Date{
    var hizukeFormat: String{
        let date:Date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        
        let sDate = format.string(from:date)
        print(sDate)
        
        return(sDate)
        
    }
    
}
