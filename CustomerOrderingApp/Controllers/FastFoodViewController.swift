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
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(buisnessInfoTapped))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
    }
    
    
    @objc func buisnessInfoTapped() {
        self.navigationController?.popViewController(animated: true)
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
        if let lastIndexPath = tableView.indexPathsForVisibleRows?.last{
//            if lastIndexPath.row <= indexPath.row{
//                cell.center.y = cell.center.y + cell.frame.height / 2
//                cell.alpha = 0
//                UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), options: [.curveEaseInOut], animations: {
//                    cell.center.y = cell.center.y - cell.frame.height / 2
//                    cell.alpha = 1
//                }, completion: nil)
//            }
//            if lastIndexPath.row <= indexPath.row{
//                UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
//                    cell.center.x += cell.frame.width
//                }, completion: nil)
//            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.pushToController(from: .main, identifier: .FoodDetailViewController)
    }
    
    
}
