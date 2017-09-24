//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/23/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {
    
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    
    var group: Group?
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupTitleLbl.text = group?.title
        DataService.instance.getEmails(forGroup: group!) { emailsArray in
            self.membersLbl.text = emailsArray.joined(separator: ", ")
        }
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
