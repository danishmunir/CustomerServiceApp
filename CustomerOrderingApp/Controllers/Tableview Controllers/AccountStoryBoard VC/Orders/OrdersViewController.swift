//
//  OrdersViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "Background")
        perpareNavigation(txtTitle: "Orders", leftImage: UIImage(named: "Cross"), rightImage: nil)
        tableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
        
    }

}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell") as! OrdersTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "SCHEDULED(10)"
        } else if section == 1 {
            return "PENDING(10)"
        } else if section == 2 {
            return "COMPLETED(10)"
        }
        return ""
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

