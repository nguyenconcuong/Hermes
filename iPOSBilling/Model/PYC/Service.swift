//
//  Service.swift
//  iPOSBilling
//
//  Created by ipos on 26/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
struct Service:Codable {
    var code: String?
    var productCode: String?
    var name:String?
    var desc:String?
    var type:String?
    var image:String?
    var unitPrice:Int?
    var unitScope:String?
    var unitName:String?
    var minChoice:Int?
    var maxChoice:Int?
    var autoSerial:Int?
}
