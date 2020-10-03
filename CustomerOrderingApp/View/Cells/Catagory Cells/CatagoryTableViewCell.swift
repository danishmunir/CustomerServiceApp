//
//  CatagoryTableViewCell.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 26/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class CatagoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var catagoryLable: UILabel!
    @IBOutlet weak var placesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgeView.roundedImage(image: imgeView)
    }

    
}
