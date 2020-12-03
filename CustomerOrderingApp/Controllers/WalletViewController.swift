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
        tableView.backgroundColor = UIColor(named: "Background")
        tableView.register(UINib(nibName: "PaymentMethodsTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodsTableViewCell")
        perpareNavigation(txtTitle: "Wallet", leftImage: UIImage(named: "Back")!, rightImage: nil)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack))
        view.addGestureRecognizer(swipe)
    }
    
    @objc func swipeBack() {
        navigationController?.popViewController(animated: true)
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
            paymentCell.cardExpiredLable.isHidden = true
            paymentCell.imgView.isHidden = true
            paymentCell.titleLabel.textColor = UIColor(named: "primaryColor")
        }
        else  if indexPath.section == 1 {
            paymentCell.accessoryType = .disclosureIndicator
            if indexPath.row == 1 {
                paymentCell.cardExpiredLable.isHidden = true
            }
        }
        else if indexPath.section == 2 {
            paymentCell.cardExpiredLable.isHidden = true
            if indexPath.row == 0 {
                paymentCell.titleLabel.text = "Apple Pay"
                
            } else if indexPath.row == 1 {
                paymentCell.titleLabel.text = "Cash on delivery"
            }
        }
        else if indexPath.section == 3 {
            paymentCell.cardExpiredLable.isHidden = true
            paymentCell.imgView.isHidden = true
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
       if section == 1{
            return  "   Payment methods"
       } else {
            return ""
       }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(named: "SectionsColor")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "SFUIText-Medium", size: 15)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
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
