//
//  AddToDoViewController.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/05/18.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class AddToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var youbiTable: UITableView!//タスクを繰り返す曜日の選択
    @IBOutlet weak var timePicker: UIDatePicker!//通知の時間設定
    @IBOutlet weak var addTabBar: UITabBarItem!
    
    
    let date = Date()
    let weeks = ["日曜","月曜","火曜","水曜","木曜","金曜","土曜"]
    // モデル作成
    let task = Task(value: ["id" : "", "name" : "", "finished": false, "date" : "", "time" : "HH:mm"])
    // デフォルトRealmを取得する
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        youbiTable.delegate = self
        textField.delegate = self
        
        // トランザクションを開始して、オブジェクトをRealmに追加する
        try! realm.write {
            realm.add(task)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeks.count
    }
    // セルのテキストを追加
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "youbiCell")
        cell.textLabel?.text = weeks[indexPath.row]
        return cell
    }
    
    // 7. セルがタップされた時
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(weeks[indexPath.row])
    }
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 1 {
            return "通知する曜日"
        }
        return nil
    }
    
    //キーボード以外タップでキーボード閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //非表示にする。
        if(textField.isFirstResponder){
            textField.resignFirstResponder()
        }
    }
    
    //改行でキーボード閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
    // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func addTask(_ sender: AnyObject) {
        if textField.text == "" {
            let alertController = UIAlertController(title: "タイトルを入力してください", message: "", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
 /*           task(id: Task.findAll().count+1, name: textField.text!, finished: false , date: "" , time: "HH:mm").save()
            
            let alertController = UIAlertController(title: "タスクを追加しました。", message: "", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            textField.text = ""
            present(alertController, animated: true, completion: nil)
        }
        print("test: addTask pushed")*/
            let task = Task()
            task.name = textField.text!
            task.finished = false
            task.date = ""
            task.time = "HH:mm"
            
        }
    }

    func timePicker(_ sender: AnyObject) {
        print("test: timePicker moved")
        // DPの値を成形
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
