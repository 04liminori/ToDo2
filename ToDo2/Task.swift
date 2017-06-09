//
//  Task.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/05/25.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class Task: Object {
    static let realm = try! Realm()
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var finished = false //タスクが終わったか
    dynamic var date = ""//通知する曜日
    dynamic var time = "HH:mm"//通知する時間
    
    override static func primaryKey() -> String {
        return "id"
    }
    // MARK: - Publics
    convenience init(id: Int, name: String, finished: Bool, date: String, time: String) {
        self.init()
        self.id = 0
        self.name = name
        self.finished = finished
        self.date = date
        self.time = time
    }
    
    static func create() -> Task{
        let task = Task()
        task.id = lastId()
        return task
    }
    
    static func loadAll() -> [Task] {
        let task = realm.objects(Task.self).sorted(byKeyPath: "id", ascending: false)
        var ret: [Task] = []
        for task in task {
            ret.append(task)
        }
        return ret
    }
    
    static func lastId() -> Int {
        if let task = realm.objects(Task.self).last {
            return task.id + 1
        } else {
            return 1
        }
    }
    
    // addのみ
    func save() {
        try! Task.realm.write {
            Task.realm.add(self)
        }
    }
    
    func update(method: (() -> Void)) {
        try! Task.realm.write {
            method()
        }
    }
    
    
    
}
