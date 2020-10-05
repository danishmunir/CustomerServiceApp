//
//  RiderViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class RiderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(named: "F8F8FA")
        perpareNavigation(txtTitle: "Order #(4335)", leftImage: UIImage(named: "Cross"), rightImage: UIImage(named: "QuestionMark"))
        tableView.register(UINib(nibName: "EstimatedArrivalTableViewCell", bundle: nil), forCellReuseIdentifier: "EstimatedArrivalTableViewCell")
    }

}

extension RiderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstimatedArrivalTableViewCell") as! EstimatedArrivalTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        }
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        let myView = UIView()
        myView.backgroundColor = UIColor(named: "F8F8FA")
        
        headerView.backgroundView = myView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
}
