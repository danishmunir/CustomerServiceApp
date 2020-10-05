//
//  AddDiscountCodeTableViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class AddDiscountCodeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "F8F8FA")
        perpareNavigation(txtTitle: "Notes for buisness", leftImage: UIImage(named: "Cross"), rightImage: nil)
        rightText()
    }
    
    
    func rightText() {
        let rightItem = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        rightItem.tintColor = UIColor(named: "primaryColor")
        
        navigationItem.rightBarButtonItem?.tintColor = .systemPink
        self.navigationItem.rightBarButtonItem = rightItem
    }
}


extension AddDiscountCodeTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        let myView = UIView()
        myView.backgroundColor = UIColor(named: "F8F8FA")
        
        headerView.backgroundView = myView
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
