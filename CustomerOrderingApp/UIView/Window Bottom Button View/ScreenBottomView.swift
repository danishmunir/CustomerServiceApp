//
//  ScreenBottomView.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 26/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import Foundation
import UIKit

class ScreenBottomView {
    
    static func goToNextScreen(button: UIButton, view: UIView, btnText: String) {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        let bottomView = UIView()
        
        window.addSubview(bottomView)
        
        bottomView.tag = 200
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        bottomView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        bottomView.backgroundColor = UIColor(named: "bottomButtonView")
        
        bottomView.addSubview(button)
        
        button.backgroundColor = .blue
        
        button.setTitle(btnText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20).isActive = true
        button.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.backgroundColor = UIColor(named: "primaryColor")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
    }
    
}
