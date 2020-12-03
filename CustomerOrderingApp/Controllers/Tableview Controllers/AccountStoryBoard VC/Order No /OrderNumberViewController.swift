//
//  OrderNumberViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class OrderNumberViewController: UIViewController {
    
    var items = ["Toppings", "Chicken Fatija", "Oilvias" , "Chilli", "Toppings", "Chicken Fatija", "Oilvias" , "Chilli", "Toppings", "Chicken Fatija", "Oilvias" , "Chilli"]
    var allLabels = [UILabel()]
    
    @IBOutlet weak var tableView: UITableView!
    
    var selected : Bool = false
    var selectedIndex : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "Background")
        perpareNavigation(txtTitle: "Order #(4335)", leftImage: UIImage(named: "Cross"), rightImage: UIImage(named: "QuestionMark"))
        tableView.register(UINib(nibName: "EstimatedArrivalTableViewCell", bundle: nil), forCellReuseIdentifier: "EstimatedArrivalTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
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
            return 4
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstimatedArrivalTableViewCell") as! EstimatedArrivalTableViewCell
        let orderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
        let defaltCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if indexPath.section == 1 {
            defaltCell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
            defaltCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
            defaltCell.textLabel?.text = "9 longrace Road, Walthamasow, London, E13 ADT"
            return defaltCell
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                defaltCell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
                defaltCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
                defaltCell.textLabel?.text = "Order from McDonalds Maal Road"
                return defaltCell
            } else if indexPath.row == 1 {
                for  lbl in items {
                    let newLabel = UILabel()
                    newLabel.textColor = UIColor(named: "SecondaryLblColor")
                    newLabel.font = UIFont(name: ".SFUIText-Regular", size: 15)
                    newLabel.text = lbl
                    allLabels.append(newLabel)
                    orderListCell.stackView.addArrangedSubview(newLabel)
                }
                return orderListCell
            } else if indexPath.row == 2 {
                
                return orderListCell
            }
            
            else if indexPath.row == 3 {
                defaltCell.textLabel?.textColor = UIColor(named: "primaryColor")
                defaltCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
                defaltCell.textLabel?.text = "View order receipt"
                defaltCell.accessoryType = .disclosureIndicator
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

