//
//  EditAccountTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 29/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class EditAccountTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor =  UIColor(named: "F8F8FA")
        perpareNavigation(txtTitle: "Edit Account", leftImage: UIImage(named: "Back")!, rightImage: nil)
        
    }
}


extension EditAccountTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        let myView = UIView()
        
        headerView.textLabel?.text = ""
        myView.backgroundColor = UIColor(named: "F8F8FA")
        headerView.backgroundView = myView
    }
    
}
