//
//  BasketViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 16/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "TotalOfItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalOfItemsTableViewCell")
        tableView.register(UINib(nibName: "PayViaTableViewCell", bundle: nil), forCellReuseIdentifier: "PayViaTableViewCell")
        
        //        tableView.register(UINib(nibName: "DeliverHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliverHeaderTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 3 || section == 4  {
            return 1
        } else if section == 1 || section == 5 || section == 6 {
            return 2
        } else if section == 2{
            return 6
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.selectionStyle = .none
        let orderItem = tableView.dequeueReusableCell(withIdentifier: "OrderItemTableViewCell", for: indexPath) as! OrderItemTableViewCell
        orderItem.selectionStyle = .none
        let totalcell = tableView.dequeueReusableCell(withIdentifier: "TotalOfItemsTableViewCell", for: indexPath) as! TotalOfItemsTableViewCell
        totalcell.selectionStyle = .none
        let payViaCell = tableView.dequeueReusableCell(withIdentifier: "PayViaTableViewCell", for: indexPath) as! PayViaTableViewCell
        payViaCell.selectionStyle = .none
        if indexPath.section == 0 {
            cell.textLabel?.text = "   Pickup/Delivery time: 20-35min"
            cell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "   Add deliver address"
                cell.textLabel?.textColor = UIColor(named: "primaryColor")
                cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
            } else   if indexPath.row == 1 {
                cell.textLabel?.text = "   Add order notes for deliver courier"
                cell.textLabel?.textColor = UIColor(named: "primaryColor")
                cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 4 {
                return totalcell
            } else if indexPath.row == 5 {
                cell.textLabel?.text = "   How does our fees structure work?"
                cell.textLabel?.textColor = UIColor(named: "primaryColor")
                cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
            }else {
                return orderItem
            }
        } else if indexPath.section == 3 {
            cell.textLabel?.text = "   Add order notes for buisness"
            cell.textLabel?.textColor = UIColor(named: "primaryColor")
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        }  else if indexPath.section == 4 {
            cell.textLabel?.text = "   Add discount code"
            cell.textLabel?.textColor = UIColor(named: "primaryColor")
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        }
        else if indexPath.section == 5 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "   Add payment method"
                cell.textLabel?.textColor = UIColor(named: "primaryColor")
                cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
                let accessoryImage = UIImageView(image: UIImage(named: "Arrows"))
                cell.accessoryView = accessoryImage
                
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "   **** 6012"
                cell.textLabel?.textColor = UIColor(named: "PrimaryLabelColorDefault")
                cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
                let accessoryImage = UIImageView(image: UIImage(named: "Arrows"))
                cell.accessoryView = accessoryImage
                
            }
            
        } else if indexPath.section == 6 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "This business uses their own staff to deliver orders, you will therefore recieve limited tracking information. By placing this order, you agree to share your name, phone number, and address with the business. The business will only use your information for this order."
                cell.textLabel?.textColor = UIColor(named: "SecondaryLblColor")
                cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.textAlignment = .left
                
            }
            else {
                return payViaCell
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                self.pushToController(from: .main, identifier: .DeliverDetailsTableViewController)
            } else if indexPath.row == 1 {
                self.pushToController(from: .account, identifier: .NotesForDeliveryCourierTableViewController)
            } else if indexPath.row == 2 {
                self.pushToController(from: .account, identifier: .NotesForBuisnessTableViewController)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(named: "SectionsColor")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
        if section == 6 {
            let trackImage = UIImageView(image: UIImage(named: "Track"))
            trackImage.contentMode = .scaleAspectFit
            myView.addSubview(trackImage)
            trackImage.translatesAutoresizingMaskIntoConstraints = false
            trackImage.centerYAnchor.constraint(equalTo: headerView.textLabel!.centerYAnchor).isActive = true
            trackImage.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -20).isActive = true
            trackImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
            trackImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
            headerView.backgroundView = myView
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 4 {
            return 20
        } else if section == 1 || section == 2 || section == 5 || section == 6 {
            return 50
        } else if section == 3 {
            return 25
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "   Deliver to"
        }
        else if section == 2 {
            return "   Your order"
        }
        else if section == 5 {
            return "   Pay via"
        } else if section == 6 {
            return "   Delivered by the buisness staff"
        }
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
