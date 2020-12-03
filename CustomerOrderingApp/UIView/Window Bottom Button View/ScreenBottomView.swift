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
    static let useCartButton = true
    
    static func goToNextScreen(button: UIButton, view: UIView, btnText: String) {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        let bottomView = UIView()
        
        
        
        window.addSubview(bottomView)
        
        bottomView.tag = 200
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        //        bottomView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        bottomView.backgroundColor = UIColor(named: "bottomButtonView")
        
        bottomView.addSubview(button)
        
        //        button.backgroundColor = .blue
        
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
    
    
    static func viewCartButton(button: UIButton, view: UIView, btnText: String, cartLableTxt: String, resultLabelTxt: String) {
        
        if useCartButton == true {
            guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
            let bottomView = UIView()
            let cartView = UIView()
            let cartLabel = UILabel()
            let resultLabel = UILabel()
            
            window.addSubview(bottomView)
            
            bottomView.tag = 201
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            bottomView.heightAnchor.constraint(equalToConstant: 70).isActive = true
            bottomView.backgroundColor = UIColor(named: "bottomButtonView")
            
            bottomView.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20).isActive = true
            button.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20).isActive = true
            button.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
            button.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10).isActive = true
            button.heightAnchor.constraint(equalToConstant: 35).isActive = true
            button.backgroundColor = UIColor(named: "primaryColor")
            button.setTitle(btnText, for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
            button.setTitleColor(.white, for: .normal)
            //        button.layer.cornerRadius = 4
            
            
            button.addSubview(resultLabel)
            
            resultLabel.translatesAutoresizingMaskIntoConstraints = false
            resultLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10).isActive = true
            resultLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 0).isActive = true
            resultLabel.textColor = .white
            resultLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
            resultLabel.text = resultLabelTxt
            button.addSubview(cartView)
            
            
            cartView.translatesAutoresizingMaskIntoConstraints = false
            cartView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 15).isActive = true
            cartView.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 0).isActive = true
            cartView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            cartView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            cartView.layer.cornerRadius = 5
            cartView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            
            
            cartView.addSubview(cartLabel)
            
            cartLabel.translatesAutoresizingMaskIntoConstraints = false
            cartLabel.centerYAnchor.constraint(equalTo: cartView.centerYAnchor, constant: 0).isActive = true
            cartLabel.centerXAnchor.constraint(equalTo: cartView.centerXAnchor, constant: 0).isActive = true
            
            
            cartLabel.textColor = .white
            
            cartLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
            cartLabel.text = cartLableTxt
        } else {
            print("Cart Btn is not shown")
        }
        
        
        
        
    }
    
    
}
