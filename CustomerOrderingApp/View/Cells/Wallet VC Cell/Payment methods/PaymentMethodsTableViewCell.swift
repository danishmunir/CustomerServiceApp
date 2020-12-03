//
//  PaymentMethodsTableViewCell.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 30/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class PaymentMethodsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardExpiredLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
