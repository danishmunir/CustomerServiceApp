//
//  LoginTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 25/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationleftButton()
        cornerRaiusOfBtns()
        perpareNavigation(txtTitle: "Register or login", leftImage: UIImage(named: "Cross"), rightImage: nil)
//        tableView.backgroundColor = UIColor(named: "Background")
    }
    //MARK: - Functions
    
    func cornerRaiusOfBtns() {
        googleBtn.layer.borderWidth = 0.5
        googleBtn.layer.borderColor = UIColor.black.cgColor
        appleBtn.layer.cornerRadius = 4
        fbBtn.layer.cornerRadius = 4
        googleBtn.layer.cornerRadius = 4
        emailBtn.layer.cornerRadius = 4
        loginBtn.layer.cornerRadius = 4
    }
    func navigationleftButton() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "Cross")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self , action: #selector(popViewController))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func popViewController(){
        
//        navigationController?.popViewController(animated: true)
        
        //Transition in this
        let transition = CATransition()
         transition.duration = 0.3
         transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
         transition.type = CATransitionType.reveal
         transition.subtype = CATransitionSubtype.fromBottom
         navigationController?.view.layer.add(transition, forKey: nil)
         _ = navigationController?.popViewController(animated: false)
    }
    
    //MARK: - IBActions
    
    @IBAction func registerWithEmailTapped(_ sender: Any) {
        self.pushToController(from: .main, identifier: .RegisterTableViewController)
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.pushToController(from: .main, identifier: .CatagoriesViewController)
        
    }
    
}



//MARK: - TableView Ovverride Functions
extension LoginTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 {
            return CGFloat.leastNormalMagnitude
        }
        return 0
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 2 {
            return "By registering with email you agree to our T&Cs and Privacy policy."
        }
        return ""
    }
}


