//
//  UINavigationController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 29/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func perpareNavigation(txtTitle: String, leftImage: UIImage?, rightImage: UIImage?) {
        prepareTitleView(str: txtTitle)
        let leftButton = UIBarButtonItem(image: leftImage?.withRenderingMode(.alwaysOriginal), style: .plain, target: self , action: #selector(btnTapped))
        self.navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(image: rightImage?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil , action: nil)
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func btnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func prepareTitleView(str: String) {
        let titlelabel                       = UILabel()
        titlelabel.text                      = str
        titlelabel.font                      = UIFont(name: "Helvetica Neue", size: 15)
        titlelabel.textColor                 = .black
        titlelabel.backgroundColor           = .clear
        titlelabel.adjustsFontSizeToFitWidth = true
        titlelabel.textAlignment             = .center
        titlelabel.autoresizesSubviews       = true
        self.navigationItem.titleView        = titlelabel
        
    }
}

extension UIViewController {
    
    
    @objc func BackBtnTapped() {
        
    }
}
