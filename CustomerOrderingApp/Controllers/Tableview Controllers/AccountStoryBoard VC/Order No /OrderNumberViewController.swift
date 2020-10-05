//
//  OrderNumberViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class OrderNumberViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "F8F8FA")
        perpareNavigation(txtTitle: "Order #(4335)", leftImage: UIImage(named: "Cross"), rightImage: UIImage(named: "QuestionMark"))
        tableView.register(UINib(nibName: "EstimatedArrivalTableViewCell", bundle: nil), forCellReuseIdentifier: "EstimatedArrivalTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "OrderNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderNumberTableViewCell")
        tableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
    }
    
}



extension OrderNumberViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 3
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstimatedArrivalTableViewCell") as! EstimatedArrivalTableViewCell
        let orderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
        let defaltCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let orderNumberCell = tableView.dequeueReusableCell(withIdentifier: "OrderNumberTableViewCell") as! OrderNumberTableViewCell
        if indexPath.section == 1 {
            defaltCell.textLabel?.textColor = .black
            defaltCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
            defaltCell.textLabel?.text = "9 longrace Road, Walthamasow, London, E13 ADT"
            return defaltCell
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                return orderNumberCell
            } else if indexPath.row == 1 {
                return orderListCell
            } else if indexPath.row == 2 {
                defaltCell.textLabel?.textColor = UIColor(named: "primaryColor")
                defaltCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
                defaltCell.textLabel?.text = "View order receipt"
                return defaltCell
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        } 
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Delivery address".localizedCapitalized
        } else if section == 2 {
            return "Order summary".localizedCapitalized
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        let myView = UIView()
        myView.backgroundColor = UIColor(named: "F8F8FA")
        
        headerView.backgroundView = myView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}

