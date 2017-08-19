//
//  WeekTask.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/07/26.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class WeekTask: Object {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var finished = false //タスクが終わったか
    
    override static func primaryKey() -> String {
        return "id"
    }

}
