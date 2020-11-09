//
//  CatagoriesViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 26/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

//03045903545
import UIKit

class CatagoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CatagoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CatagoryTableViewCell")
        tableView.register(UINib(nibName: "SearchBarHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchBarHeaderTableViewCell")
        perpareNavigation(txtTitle: "Categories", leftImage: UIImage(named: "Cross"), rightImage: nil)
    }
    
    
    
}

extension CatagoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatagoryTableViewCell", for: indexPath) as! CatagoryTableViewCell
        return cell
    }
    
    
}


extension CatagoriesViewController {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "SearchBarHeaderTableViewCell") as! SearchBarHeaderTableViewCell
        headerCell.backgroundColor = .white
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "FastFoodViewController") as! FastFoodViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
