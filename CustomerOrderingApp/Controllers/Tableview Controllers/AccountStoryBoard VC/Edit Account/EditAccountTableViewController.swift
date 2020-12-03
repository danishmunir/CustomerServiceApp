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
        tableView.backgroundColor =  UIColor(named: "Background")
        perpareNavigation(txtTitle: "Edit Account", leftImage: UIImage(named: "Back")!, rightImage: nil)
        
    }
}


extension EditAccountTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(named: "SectionsColor")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "SFUIText-Medium", size: 15)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
    }
    
}
