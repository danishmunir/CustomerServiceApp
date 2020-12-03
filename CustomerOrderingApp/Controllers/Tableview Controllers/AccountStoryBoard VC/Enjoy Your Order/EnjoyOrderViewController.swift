//
//  EnjoyOrderViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 06/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class EnjoyOrderViewController: UIViewController {
    
    var cellIdentifiers: [String] = ["EnjoyYourOrderTableViewCell", "OrderNumberTableViewCell", "OrderListTableViewCell"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "Background")
        perpareNavigation(txtTitle: "Order #(4335)", leftImage: UIImage(named: "Cross"), rightImage: UIImage(named: "QuestionMark"))
        
        cellIdentifiers.forEach { (identifier) in
            tableView.register(UINib(nibName: "\(identifier)", bundle: nil), forCellReuseIdentifier: "\(identifier)")
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
}

extension EnjoyOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let enjoyCell = tableView.dequeueReusableCell(withIdentifier: "EnjoyYourOrderTableViewCell") as! EnjoyYourOrderTableViewCell
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let oderNumberCell = tableView.dequeueReusableCell(withIdentifier: "OrderNumberTableViewCell") as! OrderNumberTableViewCell
        let orderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
        if indexPath.section == 1 {
            defaultCell.textLabel?.text = "9 Longarace Road, Walthamshow, London, E17 4DT"
            defaultCell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
            defaultCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 13)
            return defaultCell
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                return oderNumberCell
            } else if indexPath.row == 1 {
                return orderListCell
            } else if indexPath.row == 2 {
                defaultCell.textLabel?.text = "View order receipt"
                defaultCell.textLabel?.textColor = UIColor(named: "primaryColor")
                defaultCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 13)
                return defaultCell
            }
        }
        return enjoyCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Delivery address".localizedCapitalized
        } else if section == 2 {
            return "Order summary".localizedCapitalized
        } else {
            return ""
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        }
        return 50
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
