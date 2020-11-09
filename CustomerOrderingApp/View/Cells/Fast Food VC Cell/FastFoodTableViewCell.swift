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
    @IBOutlet weak var starImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 2
        starImgView.image = starImgView.image?.withRenderingMode(.alwaysTemplate)
        starImgView.tintColor = UIColor(named: "primaryColor")
        mainView.uiViewShadow(myView: mainView)
        
        
    }
    
    
    
}
