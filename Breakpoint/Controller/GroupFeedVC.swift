//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/23/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {
    
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    
    var group: Group?
    var groupMessageArray = [Message]()
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupTitleLbl.text = group?.title
        DataService.instance.getEmails(forGroup: group!) { emailsArray in
            self.membersLbl.text = emailsArray.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { snapshot in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { groupMessageArray in
                self.groupMessageArray = groupMessageArray
                self.tableView.reloadData()
                
                if self.groupMessageArray.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessageArray.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, forGroupKey: group?.key, sendComplete: { messageSent in
                if messageSent {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            })
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell") as? GroupFeedCell else { return UITableViewCell() }
        let message = groupMessageArray[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { email in
            cell.configureCell(profile: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
    }
}
