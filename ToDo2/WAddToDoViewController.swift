//
//  WAddToDoViewController.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/08/20.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class WAddToDoViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var WTextField: UITextField!
    @IBOutlet weak var WAddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WTextField.delegate = self as? UITextFieldDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //キーボード以外タップでキーボード閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //非表示にする。
        if(WTextField.isFirstResponder){
            WTextField.resignFirstResponder()
        }
    }
    
    //改行でキーボード閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func addTask(_ sender: AnyObject) {

        let newTask = Task()
        
        // textFieldに入力したデータをnewTodoのtitleに代入
        newTask.name = WTextField.text!
        
        // 上記で代入したテキストデータを永続化するための処理
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newTask)
                print("Task Saved")
            })
        } catch {
            print("Save is Faild")
            //                }
            //            }
        }
        self.navigationController?.popToRootViewController(animated: true)
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
