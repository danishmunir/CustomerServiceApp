//
//  OrderHelpBeforePrepareViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 30/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class OrderHelpBeforePrepareViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension OrderHelpBeforePrepareViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
        cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        cell.textLabel?.text = "Family kebap fish bar"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
            return "Schedule orders (1)".localizedCapitalized
    
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(named: "SectionsColor")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
}
