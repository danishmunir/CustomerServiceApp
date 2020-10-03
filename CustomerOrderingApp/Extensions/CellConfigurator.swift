//
//  CellConfigurator.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 30/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import Foundation
import UIKit

struct CellConfigurator {
    var cellIdentifier: String = ""
    var title: String = ""
    var size = CGSize.zero
    var headerSize = CGSize.zero
    var item: Any?
    var items: [Any]
}
