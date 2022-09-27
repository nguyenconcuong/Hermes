//
//  ProductList.swift
//  iPOSBilling
//
//  Created by ipos on 25/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
struct ProductList:Codable {
    var count: Int?
    var page: Int?
    var numPerPage: Int?
    var data:[Product]?
}
