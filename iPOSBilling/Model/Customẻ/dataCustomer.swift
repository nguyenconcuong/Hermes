//
//  dataCustomer.swift
//  iPOSBilling
//
//  Created by ipos on 25/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
struct DataCustomer:Codable {
    var companies: [Customer]?
    var count: Int!
}
