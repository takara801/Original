//
//  Memo.swift
//  Original
//
//  Created by USER on 2021/12/15.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var mokuhyou: String = ""
    @objc dynamic var hizuke: String = ""
    @objc dynamic var label: String = ""
    @objc dynamic var time: String = ""
    @objc dynamic var memo: String = ""
}

