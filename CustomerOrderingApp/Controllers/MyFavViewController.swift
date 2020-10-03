//
//  MyFavViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 29/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class MyFavViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "F8F8FA")
        tableView.register(UINib(nibName: "FastFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FastFoodTableViewCell")
        perpareNavigation(txtTitle: "Your favorites", leftImage: UIImage(named: "Back")!, rightImage: UIImage(named: "Sort"))
    }
    
    
}


extension MyFavViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FastFoodTableViewCell", for: indexPath) as! FastFoodTableViewCell
        return cell
    }
    
    
}
