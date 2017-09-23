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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTabelView.delegate = self
        groupTabelView.dataSource = self
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupTabelView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell() }
        cell.configureCell(title: "VEKARIYA FAMILY", description: "WELCOME TO OUR SWEET FAMILY!", count: 3)
        return cell
    }
}

