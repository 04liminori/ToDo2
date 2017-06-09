//
//  TodayTaskTableViewCell.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/05/25.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class TodayTaskTableViewCell: UITableViewCell {
    
    let tasks = Task.loadAll()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
