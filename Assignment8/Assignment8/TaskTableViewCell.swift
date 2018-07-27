//
//  TaskTableViewCell.swift
//  Assignment8
//
//  Created by 北田晴佳 on 2018/06/11.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "TaskCell"
    
    // MARK: -
    @IBOutlet weak var taskLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
