//
//  NotesForDeliveryCourierTableViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class NotesForDeliveryCourierTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "Background")
        perpareNavigation(txtTitle: "Notes for delivery courier", leftImage: UIImage(named: "Cross"), rightImage: nil)
        rightText()

    }
    
    func rightText() {
        let rightItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        rightItem.tintColor = UIColor(named: "primaryColor")
        
        navigationItem.rightBarButtonItem?.tintColor = .systemPink
        self.navigationItem.rightBarButtonItem = rightItem
    }


}

extension NotesForDeliveryCourierTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
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
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
