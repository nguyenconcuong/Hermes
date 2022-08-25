//
//  UserModal.swift
//  iPOSBilling
//
//  Created by ipos on 24/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
struct User: Codable{
   var email: String
    var deptCode: String?
    var teamId: String?
    var role: String?
    var name: String?
    var phone: String?
    var image: String?
    var token: String
    var city: String?
    var gender: Int?
    var birthday: String?
    var code: String
    var textSearch: String?
    var isOnline: Int
    var _id: String
    var status: String

}
