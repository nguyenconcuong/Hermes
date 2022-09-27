//
//  RequestOrder.swift
//  iPOSBilling
//
//  Created by ipos on 22/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
struct RequestOrder {
    
    var roCode:Int?
    var picSale:String?
    var salePhone:String?
    var saleName:String?
    var picDept:String?
    var picTeam:String?
    var companyId:String?
    var customerName:String?
    var contactId:String?
    var contactName:String?
    var contactCompany:String?
    var contactPhone:String?
    var companyTaxCode:String?
    var companyTaxEmail:String?
    var companyFullAddess:String?
    var contactTitle:String?
    var productCode:String?
    var contractNote:String?
    var contractCode:String?
    var contractType:String?
    var type:String?
    var pickUpAt:String?
    var pickUpAddress:String?
    var deploymentType:String?
    var deploymentAddress:String?
    var deploymentTime:String?
    var deployTechForm:String?
    var adminStatus:String?
    var warehouseStatus:String?
    var partnerStatus:String?
    var details:[PYCDetail]?
    
}
