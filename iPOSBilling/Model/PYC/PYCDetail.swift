//
//  PYCDetail.swift
//  iPOSBilling
//
//  Created by ipos on 22/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
struct PYCDetail {
    var productCode: String
    var serviceCode: String?
    var serviceName: String
    var quantity: Int
    var orgPrice: Int
    var salePrice: Int
    var amount:Int
    var serviceType:String
    var serviceScopeL:String
    var serviceUnit:String
    var serviceDesc:String
    var discountAmount: Int
    var comboId:String
}
