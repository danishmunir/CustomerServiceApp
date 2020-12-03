//
//  OrderListTableViewCell.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet weak var quatityItemLabel: UILabel!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackLable: UILabel!
    
    var btnTapped: ((_ value: Int) -> (Void))?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func seeMoreBtnTapped(sender: UIButton) {
        if let btnTapped = self.btnTapped {
            btnTapped(sender.tag)
        }
    }
    
}


