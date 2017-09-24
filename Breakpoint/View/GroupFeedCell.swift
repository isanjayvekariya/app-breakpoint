//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/23/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profile: UIImage, email: String, content: String) {
        self.profileImg.image = profile
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
