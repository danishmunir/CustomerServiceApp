//
//  ChoiceOfSideTableViewCell.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 30/11/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class ChoiceOfSideTableViewCell: UITableViewCell {

    @IBOutlet weak var tickImg: UIImageView!
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
