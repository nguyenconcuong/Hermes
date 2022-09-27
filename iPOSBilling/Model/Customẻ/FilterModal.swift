//
//  FilterModal.swift
//  iPOSBilling
//
//  Created by ipos on 09/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
class Filter {
    var sortBy: String?
    var pickStatus: String?
    var pickSale: String?
    var pickTeam: String?
    var pickTeamId: String?
    var pickDept: Department?
    var pickDateStart: String?
    var picDateEnd: String?
    var pickDepartment: String?
    func getDataToArray() -> [String]{
        var arrayData: [String] = []
        if let sortBy = self.sortBy, self.sortBy == "-name" {
            arrayData.append("Sắp xếp theo:ABC")
        } else{
            arrayData.append("Sắp xếp theo:theo thời gian tạo")
        }
        if  let pickStatus = self.pickStatus,self.pickStatus != "--- Chọn tất cả ---"{
            arrayData.append("Trạng thái:\(pickStatus)")
        }
        if  let pickDept = self.pickDept?.name, self.pickDept?.name != "--- Chọn tất cả ---"{
            arrayData.append("Phòng:\(pickDept)")
        }
        if let pickTeam = self.pickTeam,self.pickTeam != "--- Chọn tất cả ---"{
            arrayData.append("Team:\(pickTeam)")
        }
        if  let pickSale = self.pickSale , self.pickSale != "--- Chọn tất cả ---" {
            arrayData.append("Phụ trách:\(pickSale)")
        }

        if let pickDateStart =  self.pickDateStart,self.pickDateStart != "",let picDateEnd = self.picDateEnd, self.picDateEnd != ""{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
               arrayData.append("ngày tạo:\(pickDateStart) - \(picDateEnd)")
        }
        return arrayData
    }

    init() {
        self.sortBy = "-name"
        self.pickDepartment = "--- Chọn tất cả ---"
        self.pickDept = Department(code: "--- Chọn tất cả ---", name: "--- Chọn tất cả ---", isReport: 0)
        self.pickSale = "--- Chọn tất cả ---"
        self.pickStatus = "--- Chọn tất cả ---"
        self.pickTeam = "--- Chọn tất cả ---"
        self.pickTeamId = "--- Chọn tất cả ---"
        self.picDateEnd = ""
        self.pickDateStart = ""
    }
    init(sortBy: String?,
     pickStatus: String?,
     pickSale: String?,
     pickTeam: String?,
     pickTeamId: String?,
     pickDept: Department?,
     pickDateStart: String?,
     picDateEnd: String?,
     pickDepartment: String?) {
        self.sortBy = sortBy
        self.pickStatus = pickStatus
        self.pickSale = pickSale
        self.pickTeam = pickTeam
        self.pickTeamId = pickTeamId
        self.pickDept = pickDept
        self.pickDateStart = pickDateStart
        self.picDateEnd = picDateEnd
        self.pickDepartment = pickDepartment
    }
}
