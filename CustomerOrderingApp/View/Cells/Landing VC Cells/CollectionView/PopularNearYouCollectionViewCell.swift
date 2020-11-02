//
//  PopularNearYouCollectionViewCell.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 28/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class PopularNearYouCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = 10
//        backView.layer.cornerRadius = 10
//        backView.layer.shadowOffset = .zero
//        backView.layer.shadowColor = UIColor.lightGray.cgColor
//        backView.layer.shadowRadius = 5
//        backView.layer.shadowOpacity = 10
        
    }

}


