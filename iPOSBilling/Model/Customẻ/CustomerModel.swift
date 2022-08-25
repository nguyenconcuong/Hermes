//
//  CustomerModel.swift
//  iPOSBilling
//
//  Created by ipos on 22/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation

struct Customer: Codable {
    var companyId: String?
    var name: String?
    var address: String?
    var taxcode: String?
    var taxEmail: String?
    var contactName: String?
    var contactPhone: String?
    var facebook: String?
    var contactTitle: String?
    var contactEmail: String?
    var contactFacebook: String?
    var picSale: String?
    var mapTime: String?
}
