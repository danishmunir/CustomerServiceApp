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
    @IBOutlet weak var minsStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.uiViewShadow(myView: backView)
        backView.layer.masksToBounds = false
        
        minsStackView.layer.cornerRadius = 5
        
        DispatchQueue.main.async { [self] in
            self.imgView.roundCorners([.topRight,.topLeft], radius: 5)
            
        }
        
        
        
        

    }
    
}



