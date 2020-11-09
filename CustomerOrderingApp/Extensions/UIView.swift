//
//  UIView.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 05/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
   class RoundUIView: UIView {

       @IBInspectable var borderColor: UIColor = UIColor.white {
           didSet {
               self.layer.borderColor = borderColor.cgColor
           }
       }

       @IBInspectable var borderWidth: CGFloat = 2.0 {
           didSet {
               self.layer.borderWidth = borderWidth
           }
       }

       @IBInspectable var cornerRadius: CGFloat = 0.0 {
           didSet {
               self.layer.cornerRadius = cornerRadius
           }
       }

   }



//extension UIView {
//
//    @IBInspectable
//    var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
//
//    @IBInspectable
//    var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//
//    @IBInspectable
//    var borderColor: UIColor? {
//        get {
//            let color = UIColor.init(cgColor: layer.borderColor!)
//            return color
//        }
//        set {
//            layer.borderColor = newValue?.cgColor
//        }
//    }
//
//    @IBInspectable
//    var shadowRadius: CGFloat {
//        get {
//            return layer.shadowRadius
//        }
//        set {
//
//            layer.shadowRadius = shadowRadius
//        }
//    }
//    @IBInspectable
//    var shadowOffset : CGSize{
//
//        get{
//            return layer.shadowOffset
//        }set{
//
//            layer.shadowOffset = newValue
//        }
//    }
//
//    @IBInspectable
//    var shadowColor : UIColor{
//        get{
//            return UIColor.init(cgColor: layer.shadowColor!)
//        }
//        set {
//            layer.shadowColor = newValue.cgColor
//        }
//    }
//    @IBInspectable
//    var shadowOpacity : Float {
//
//        get{
//            return layer.shadowOpacity
//        }
//        set {
//
//            layer.shadowOpacity = newValue
//
//        }
//    }
//}



extension UIView {
    func uiViewShadow(myView: UIView) {
//        myView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
//        myView.layer.shadowOpacity = 0.3
//        myView.layer.shadowRadius = 3.0
//        myView.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
       
        myView.layer.cornerRadius = 2
        myView.layer.shadowOffset = .zero
        myView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        myView.layer.shadowRadius = 2
        myView.layer.shadowOpacity = 2
    }

}
