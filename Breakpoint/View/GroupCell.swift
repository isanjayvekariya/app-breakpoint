//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/23/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func configureCell(title: String, description: String, count: Int) {
        self.titleLabel.text = title
        self.descLabel.text = description
        self.countLabel.text = "\(count) members."
    }
    
}
