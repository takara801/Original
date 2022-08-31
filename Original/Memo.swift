//
//  Memo.swift
//  Original
//
//  Created by USER on 2021/12/15.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var hizuke: String = ""
    @objc dynamic var time: String = ""
    @objc dynamic var content: String = ""
    
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    
}

