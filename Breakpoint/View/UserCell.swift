//
//  UserCell.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/22/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool ) {
        self.profileImg.image = image
        self.emailLbl.text = email
        
        if isSelected {
            self.checkImg.isHidden = false
            showing = true
        } else {
            self.checkImg.isHidden = true
            showing = false
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
                self.checkImg.isHidden = false
                showing = true
            }   else {
                self.checkImg.isHidden = true
                showing = false
            }
        }
    }
}
