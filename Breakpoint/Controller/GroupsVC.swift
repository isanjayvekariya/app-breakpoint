//
//  SecondViewController.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/3/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    @IBOutlet weak var groupTabelView: UITableView!
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTabelView.delegate = self
        groupTabelView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { groupsSnapshot in
            DataService.instance.getAllGroup(handler: { returnedGroupsArray in
                self.groupsArray = returnedGroupsArray
                self.groupTabelView.reloadData()
            })
        }
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupTabelView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.title, description: group.description, count: group.memberCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC
        let group = groupsArray[indexPath.row]
        groupFeedVC?.initData(forGroup: group)
        present(groupFeedVC!, animated: true, completion: nil)
    }
}

