//
//  AddPaymentMTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 30/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class AddPaymentMTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perpareNavigation(txtTitle: "Add payment method", leftImage: nil, rightImage: nil)
        leftText()
        rightText()
    }
    
    
}


extension AddPaymentMTableViewController {
    func leftText() {
        let leftItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftTitleTapped))
        leftItem.tintColor = UIColor(named: "primaryColor")
        navigationItem.leftBarButtonItem?.tintColor = .red
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func rightText() {
        let rightItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        rightItem.tintColor = UIColor(named: "90949C")
        
        navigationItem.rightBarButtonItem?.tintColor = .systemPink
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func leftTitleTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension AddPaymentMTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = .black
        
        let myView = UIView()
        
        headerView.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        myView.backgroundColor = UIColor(named: "F8F8FA")
        headerView.backgroundView = myView
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
}
