//
//  TodayTableViewCell.swift
//  ToDo2
//
//  Created by fukumoriminori on 2017/09/07.
//  Copyright © 2017年 fukumoriminori. All rights reserved.
//

import UIKit
import RealmSwift

class TodayTableViewCell: UITableViewCell {
    
    @IBOutlet var todayNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
