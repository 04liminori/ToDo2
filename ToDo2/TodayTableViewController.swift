//
//  TodayTableViewController.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/08/22.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class TodayTableViewController: UITableViewController, UITabBarDelegate {
    
    var tasks: Results<Task>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let realm = try Realm()
            tasks = realm.objects(Task.self)
            print(tasks)
            tableView.reloadData()
        }catch{
            
        }
    }
    // 追加 画面が表示される際などにtableViewのデータを再読み込みする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Int(tasks.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath)->UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "TodayCell")
        // todoItemに代入されたデータをobject:NSArrayに代入
        let object = tasks[indexpath.row]
        //cellのtextLabelのtextにobjectのtitleプロパティを代入
        cell.textLabel?.text = object.name
        
        return cell
    }*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // 任意の値に変更する ( 1 セクションあたりの行数 )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Int(tasks.count)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell", for: indexPath as IndexPath as IndexPath) // reuseIdentifier を cell に設定した Identifier に書き換える
        
        // Configure the cell...
        
        return cell
    }

    // TableViewのCellの削除を行った際に、Realmに保存したデータを削除する
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.tasks[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
            }catch{
            }
            tableView.reloadData()
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
