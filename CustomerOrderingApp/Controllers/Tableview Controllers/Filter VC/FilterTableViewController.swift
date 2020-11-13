//
//  FilterTableViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 02/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.perpareNavigation(txtTitle: "Filters", leftImage: UIImage(named: "Cross"), rightImage: nil)
        rightText()
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func rightText() {
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Clear all"
        longTitleLabel.font = UIFont.systemFont(ofSize: 15)
        longTitleLabel.sizeToFit()
        longTitleLabel.textColor = .red
        
        
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.rightBarButtonItem = leftItem
    }
    
    
}


extension FilterTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
  
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Dinnig options"
        } else if section == 1 {
            return "Sort by"
        } else if section == 2 {
            return "Price range"
        } else if section == 3 {
            return "Dietry"
        }
        return ""
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(named: "WhiteBackWithDark")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
   
}

