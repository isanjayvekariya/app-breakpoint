//
//  CreateGroupsVC.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/22/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    //Outlets
    @IBOutlet weak var titleTxtField: InsetTextField!
    @IBOutlet weak var descriptionTxtField: InsetTextField!
    @IBOutlet weak var emailSearchTxtField: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
    }
    
}
