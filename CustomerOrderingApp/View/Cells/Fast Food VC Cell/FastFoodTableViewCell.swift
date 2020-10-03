//
//  FastFoodTableViewCell.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 28/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class FastFoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 3
        mainView.layer.cornerRadius = 2
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        mainView.layer.shadowRadius = 5
        mainView.layer.shadowOpacity = 1
        
        
        
    }
    
    
    
}
