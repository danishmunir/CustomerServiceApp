//
//  Storyboard.swift
//  PsdPractice
//
//  Created by Zeeshan Munir on 11/12/2019.
//  Copyright © 2019 Danish Munir. All rights reserved.
//

import UIKit

let mainBundle          = Bundle.main


enum Storyboard: String {
    case main           = "Main"
}

// MARK: Main
extension Storyboard {
    enum Main: String {
        case DeliverDetailsTableViewController
        case CatagoriesViewController
        case FilterTableViewController
        case FastFoodViewController
       
        
        
        var instance: UIViewController {
            return UIStoryboard(name: Storyboard.main.rawValue, bundle: mainBundle).instantiateViewController(withIdentifier: self.rawValue)
        }
    }
    
}


