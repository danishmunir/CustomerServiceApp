//
//  AddToBasketViewController.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 30/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class AddToBasketViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PopularDealsTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularDealsTableViewCell")
        tableView.register(UINib(nibName: "ChoiceOfSideTableViewCell", bundle: nil), forCellReuseIdentifier: "ChoiceOfSideTableViewCell")
        tableView.register(UINib(nibName: "ChoiceOfToppingsTableViewCell", bundle: nil), forCellReuseIdentifier: "ChoiceOfToppingsTableViewCell")
        tableView.backgroundColor = UIColor(named: "Background")
    }
}

extension AddToBasketViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1  || section == 2{
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dealsCell = tableView.dequeueReusableCell(withIdentifier: "PopularDealsTableViewCell") as! PopularDealsTableViewCell
        let choiceOfSideCell = tableView.dequeueReusableCell(withIdentifier: "ChoiceOfSideTableViewCell") as! ChoiceOfSideTableViewCell
        let choiceOfToppings = tableView.dequeueReusableCell(withIdentifier: "ChoiceOfToppingsTableViewCell") as! ChoiceOfToppingsTableViewCell
        if indexPath.section == 0 {
            return dealsCell
        } else if indexPath.section == 1{
            if indexPath.row == 3 {
                choiceOfSideCell.tickImg.isHidden = false
            }
            return choiceOfSideCell
        } else if indexPath.section == 2{
            return choiceOfToppings
        }
      return dealsCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 {
            return 60
        }
       return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         if section == 1{
            return "Choice of Side"
         } else if section == 2 {
            return "Choice of toppings (Pick up to 6)"
         }
        return ""
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
    }
    
    
}
