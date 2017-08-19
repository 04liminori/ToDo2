//
//  TodayTasksViewController.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/05/22.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit

class TodayTasksViewController: UIViewController, UITableViewDelegate, UITabBarDelegate {
    
    @IBOutlet weak var taskTable: UITableView!
    @IBOutlet weak var TabBar: UITabBar!
    @IBOutlet weak var todayTabBar: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの個数を指定するデリゲートメソッド（必須）
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    return Task.count
    //}
    
    // セルに値を設定するデータソースメソッド（必須）
    @nonobjc internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayTasksCell") as! TodayTaskTableViewCell
            //cell.textLabel?.text = tasks.name
            return cell
        
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
