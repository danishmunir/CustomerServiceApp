//
//  LandingViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 27/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var searchandTextFiledView: UIView!
    @IBOutlet weak var DeliveryRectangleImageView: UIImageView!
    @IBOutlet weak var pickRectangleImageView: UIImageView!
    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var pickupBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchandTextFiledView.layer.cornerRadius = 5
        imgView.roundedImage(image: imgView)
        tableView.register(UINib(nibName: "PaginationTableViewCell", bundle: nil), forCellReuseIdentifier: "PaginationTableViewCell")
    }
    
    //MARK: IBActions
    @IBAction func deliveryBtnTapped(_ sender: Any) {
        
        DeliveryRectangleImageView.isHidden = false
        pickRectangleImageView.isHidden = true
        deliveryBtn.setTitleColor(.white, for: .normal)
        pickupBtn.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
    }
    
    @IBAction func pickupBtnTapped(_ sender: UIButton) {
        //        if sender.isSelected != true
        //        {
        //          UIView.animate(withDuration: 2.0, animations: {
        //            self.DeliveryRectangleImageView.frame.origin.x = self.pickupBtn.center.x
        //          })
        //        }
        DeliveryRectangleImageView.isHidden = true
        pickRectangleImageView.isHidden = false
        deliveryBtn.setTitleColor(UIColor(named: "primaryColor"), for: .normal)
        pickupBtn.setTitleColor(.white, for: .normal)
        
    }
    
}


extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let paginationCell = tableView.dequeueReusableCell(withIdentifier: "PaginationTableViewCell", for: indexPath) as! PaginationTableViewCell
            return paginationCell
        }
        
        return UITableViewCell()
    }
}


