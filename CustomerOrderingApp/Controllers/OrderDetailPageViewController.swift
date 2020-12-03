//
//  OrderDetailPageViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 30/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class OrderDetailPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Toppings", "Chicken Fatija", "Oilvias" , "Chilli", "Toppings", "Chicken Fatija", "Oilvias" , "Chilli", "Toppings", "Chicken Fatija", "Oilvias" , "Chilli"]
    var allLabels = [UILabel()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "DeliverdTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliverdTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
        tableView.register(UINib(nibName: "DeliveryFeeTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliveryFeeTableViewCell")
        
    }
}

extension OrderDetailPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 5
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2  {
            return 50
        } else if section == 3 {
            return 30
        }
        return 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Delivery address".localizedCapitalized
        } else if section == 2 {
            return "Your order".localizedCapitalized
        }
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliverdTableViewCell") as! DeliverdTableViewCell
        let orderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
        let deliverdFeeCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryFeeTableViewCell") as! DeliveryFeeTableViewCell
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if indexPath.section == 0 {
            return cell
        } else if indexPath.section == 1 {
            defaultCell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
            defaultCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
            defaultCell.textLabel?.text = "9 longrace Road, Walthamasow, London, E13 ADT"
            return defaultCell
        } else if indexPath.section == 2 {
            if indexPath.row == 1 {
                for  lbl in items {
                    let newLabel = UILabel()
                    newLabel.textColor = UIColor(named: "SecondaryLblColor")
                    newLabel.font = UIFont(name: ".SFUIText-Regular", size: 15)
                    newLabel.text = lbl
                    allLabels.append(newLabel)
                    orderListCell.stackView.addArrangedSubview(newLabel)
                }
            } else if indexPath.row == 3 {
                return deliverdFeeCell
            } else if indexPath.row == 4 {
                deliverdFeeCell.titleLbl.text = "Total"
                deliverdFeeCell.titleLbl.font = UIFont(name: "SF-Pro-Text-Bold", size: 15)
                deliverdFeeCell.priceLbl.font = UIFont(name: "SF-Pro-Text-Bold", size: 15)
                return deliverdFeeCell
            }
            
            return orderListCell
            
        } else if indexPath.section == 3 {
            defaultCell.textLabel?.textColor = UIColor(named: "primaryColor")
            defaultCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
            defaultCell.accessoryType = .disclosureIndicator
            defaultCell.textLabel?.text = "View order receipt"
            return defaultCell
        }
        return cell
        
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
