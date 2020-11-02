//
//  PaginationCollectionViewCell.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 27/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class PaginationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 5
    }

}
