//
//  WalletViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 30/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "PaymentMethodsTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodsTableViewCell")
        perpareNavigation(txtTitle: "Wallet", leftImage: UIImage(named: "Back")!, rightImage: nil)
    }
    
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 2
        } else if section == 3 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let paymentCell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodsTableViewCell", for: indexPath) as! PaymentMethodsTableViewCell
        if indexPath.section == 0 {
            paymentCell.titleLabel.text = "Add a payment method"
            paymentCell.titleLabel.textColor = UIColor(named: "primaryColor")
        }
        else if indexPath.section == 1 {
            paymentCell.NextImgView.isHidden = false
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                paymentCell.titleLabel.text = "Apple Pay"
                
            } else if indexPath.row == 1 {
                paymentCell.titleLabel.text = "Cash on delivery"
            }
        }
        else if indexPath.section == 3 {
            paymentCell.titleLabel.text = "Codenamafive Cash"
            paymentCell.priceLabel.isHidden = false
        }
        return paymentCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 44
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = .black
        
        let myView = UIView()
        
        headerView.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        myView.backgroundColor = UIColor(named: "F8F8FA")
        headerView.backgroundView = myView
        if section == 0 {
            headerView.textLabel?.text = ""
        } else if section == 1{
            headerView.textLabel?.text = "     Payment methods"
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("122")
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let addPaymentVc = storyboard.instantiateViewController(withIdentifier: "AddPaymentMTableViewController") as! AddPaymentMTableViewController
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                navigationController?.pushViewController(addPaymentVc, animated: true)
            }
        }
    }
    
}
