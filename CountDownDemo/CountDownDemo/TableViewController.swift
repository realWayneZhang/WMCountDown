//
//  TableViewController.swift
//  CountDownDemo
//
//  Created by Winson Zhang on 2018/12/22.
//  Copyright © 2018 Winson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CountDownCell", bundle: nil), forCellReuseIdentifier: "CountDownCell")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountDownCell", for: indexPath) as! CountDownCell
        return cell
    }
}
