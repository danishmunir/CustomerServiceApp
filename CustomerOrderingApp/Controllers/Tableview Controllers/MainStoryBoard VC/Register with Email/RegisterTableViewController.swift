//
//  RegisterTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 25/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailAddressLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPassLabel: UITextField!
    @IBOutlet weak var phoneNoLabel: UITextField!
    
    //MARK: - Variables
    
    let bottomBtn = UIButton(type: .system)
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNoLabel.delegate = self
        navigationleftButton()
        
    }
    //when every thing is Loaded
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ScreenBottomView.goToNextScreen(button: bottomBtn, view: self.view, btnText: "Register with email")
        
        bottomBtn.addTarget(self, action: #selector(bottomBtnTapped), for: .touchUpInside)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
            else {
                return
        }
        window.viewWithTag(200)?.removeFromSuperview()
    }
    
    //MARK: - Functions
    
    @objc func bottomBtnTapped() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginTableViewController") as! LoginTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func navigationleftButton() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "Cross")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil , action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    
    
    //MARK: - IBActions
    
    @IBAction func emailValidation(_ sender: UITextField) {
        
    }
}


// MARK: - UITextFieldDelegate

extension RegisterTableViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNoLabel {
            let characterSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: characterSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        return true
    }
    
    
}



extension RegisterTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerFooterView  : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerFooterView.backgroundView = UIView()
        headerFooterView.backgroundColor = .clear
    }
}
