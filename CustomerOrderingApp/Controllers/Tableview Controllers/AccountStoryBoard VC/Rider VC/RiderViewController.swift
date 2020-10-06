//
//  RiderViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit
import GoogleMaps

class RiderViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "F8F8FA")
        perpareNavigation(txtTitle: "Order #(4335)", leftImage: UIImage(named: "Cross"), rightImage: UIImage(named: "QuestionMark"))
        tableView.register(UINib(nibName: "EstimatedArrivalTableViewCell", bundle: nil), forCellReuseIdentifier: "EstimatedArrivalTableViewCell")
        tableView.register(UINib(nibName: "RiderTableViewCell", bundle: nil), forCellReuseIdentifier: "RiderTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "RiderHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "RiderHeaderTableViewCell")
        tableView.register(UINib(nibName: "OrderNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderNumberTableViewCell")
        tableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
    }
    
}

extension RiderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1{
            return 1
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstimatedArrivalTableViewCell") as! EstimatedArrivalTableViewCell
        let riderCell = tableView.dequeueReusableCell(withIdentifier: "RiderTableViewCell") as! RiderTableViewCell
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let oderNumberCell = tableView.dequeueReusableCell(withIdentifier: "OrderNumberTableViewCell") as! OrderNumberTableViewCell
        let orderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as! OrderListTableViewCell
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                riderCell.locManager.requestWhenInUseAuthorization()
                riderCell.locManager.startUpdatingLocation()
                return riderCell
            }
        } else if indexPath.section == 1 {
            defaultCell.textLabel?.text = "3456"
            defaultCell.textLabel?.textColor = UIColor(named: "primaryColor")
            defaultCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 13)
            return defaultCell
        } else if indexPath.section == 2 {
            defaultCell.textLabel?.text = "9 Longarace Road, Walthamshow, London, E17 4DT"
            defaultCell.textLabel?.textColor = .black
            defaultCell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 13)
            return defaultCell
        } else if indexPath.section == 3 {
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
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        }
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        else if section == 1 {
            return "Order Pin".localizedCapitalized
        } else if section == 2 {
            return "Delivery address".localizedCapitalized
        } else if section == 3 {
            return "Order Summary".localizedCapitalized
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 1 {
            
            return "Reveal this PIN to the courier once you meet them with the order".localizedCapitalized
        }
        return ""
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        
        let myView = UIView()
        myView.backgroundColor = UIColor(named: "F8F8FA")
        
        headerView.backgroundView = myView
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        let myView = UIView()
        if section == 1 {
            
            headerView.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
        }
        myView.backgroundColor = UIColor(named: "F8F8FA")
        headerView.backgroundView = myView
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }
        return .leastNormalMagnitude
    }
    
}
