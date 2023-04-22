//
//  PicInfo.swift
//  FinalProject
//
//  Created by E Z on 4/22/23.
//

import Foundation
import RealmSwift

class PicInfo: Object {
        @objc dynamic var title: String = ""
        @objc dynamic var location: String = ""
        @objc dynamic var Image: Data?
        
        override static func primaryKey() -> String? {
            return "title"
        }
}

