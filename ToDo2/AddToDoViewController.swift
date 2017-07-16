//
//  AddToDoViewController.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/05/18.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class AddToDoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!

    let date = Date()
    let task = Task(value: ["id" : Int(), "name" : "", "finished": false])
    // デフォルトRealmを取得する
    var realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        textField.delegate = self
        
        // トランザクションを開始して、オブジェクトをRealmに追加する
        /*try! realm.write {
            realm.add(task)
            
        }*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            func save() {
                try! Task.realm.write {
                    Task.realm.add(task)
                    
                    func update(method: (() -> Void)) {
                        try! Task.realm.write {
                            method()
                        }
                    }
                }
                print("test: addTask pushed")
            }
        }
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
