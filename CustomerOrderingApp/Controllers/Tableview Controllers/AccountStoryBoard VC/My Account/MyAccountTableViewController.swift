//
//  MyAccountTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 29/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit



class MyAccountTableViewController: UITableViewController {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor =  UIColor(named: "F8F8FA")
        tableView.backgroundView?.backgroundColor = UIColor(named: "Background")
        perpareNavigation(txtTitle: "My Account", leftImage: UIImage(named: "Cross")!, rightImage: nil)
        
    }
    
}


extension MyAccountTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                self.pushToController(from: .account, identifier: .OrdersViewController)
            } else if indexPath.row == 1 {
                self.pushToController(from: .account, identifier: .EditAccountTableViewController)
            } else if indexPath.row == 2 {
                self.pushToController(from: .account, identifier: .WalletViewController)
            }
        } else if indexPath.section == 1{
            if indexPath.row == 2 {
                self.pushToController(from: .account, identifier: .AboutTableViewController)
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Account", bundle: nil)
//        let editVc = storyboard.instantiateViewController(withIdentifier: "EditAccountTableViewController") as! EditAccountTableViewController
//        let favVc = storyboard.instantiateViewController(withIdentifier: "MyFavViewController") as! MyFavViewController
//        let walletVc = storyboard.instantiateViewController(withIdentifier: "WalletViewController") as! WalletViewController
//        let aboutVc = storyboard.instantiateViewController(withIdentifier: "AboutTableViewController") as! AboutTableViewController
//        if indexPath.section == 1 {
//            if indexPath.row == 0 {
//                navigationController?.pushViewController(editVc, animated: true)
//            } else if indexPath.row == 1 {
//                navigationController?.pushViewController(favVc, animated: true)
//            } else if indexPath.row == 2 {
//                navigationController?.pushViewController(walletVc, animated: true)
//            }
//        }
//
//        if indexPath.section == 2 {
//            if indexPath.row == 2 {
//                navigationController?.pushViewController(aboutVc, animated: true)
//            }
//        }
//    }
    
    
    
}


