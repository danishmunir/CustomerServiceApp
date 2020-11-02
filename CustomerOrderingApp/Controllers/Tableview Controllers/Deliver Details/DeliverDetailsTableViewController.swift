//
//  DeliverDetailsTableViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 02/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class DeliverDetailsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.perpareNavigation(txtTitle: "Delivery details", leftImage: UIImage(named: "Cross"), rightImage: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    

}


extension DeliverDetailsTableViewController {
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        } else {
            return 40
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 3
        }
        return 0
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

