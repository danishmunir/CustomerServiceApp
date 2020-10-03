//
//  FastFoodViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 28/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class FastFoodViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FastFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FastFoodTableViewCell")
        perpareNavigation(txtTitle: "Fast Food", leftImage: UIImage(named: "Back"), rightImage: nil)
        rightImageBtn()
    }
    
    
    func rightImageBtn() {
        let rightButton = UIBarButtonItem(image: UIImage(named: "Sort")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self , action: #selector(rightImageBtnTapped))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightImageBtnTapped() {
        let storyBoard = UIStoryboard(name: "Account", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MyAccountTableViewController") as! MyAccountTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension FastFoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FastFoodTableViewCell", for: indexPath) as! FastFoodTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "BuisnessInformationTableViewController") as! BuisnessInformationTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
