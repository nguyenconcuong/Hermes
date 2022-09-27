//
//  ApiRequest.swift
//  iPOSBilling
//
//  Created by ipos on 24/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//
import Foundation
import QNRequest
//MARK: - RO
class ApiOperations {
    static func getListCustomer
    (   textSearch: String,
        page: Int,
        resultsPerPage: Int,
        success: @escaping (_ response: ApiResult<DataCustomer>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
       // let baseurl = Bundle.main.infoDictionary?["baseURL"] as? String
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
        let url =  "\(baseUrl)/billing/api/customer/company/list"
        let api = ApiRequest(urlRequest:  url, type: .get)
        api.params["textSearch"] = textSearch
        api.params["page"] = page
        api.params["results_per_page"] = resultsPerPage
        if let token = AppDelegate.shareDelegate.user?.token{
            api.header = [
                "token" : token,
                "Content-Type": "application/json"
            ]
        }
        
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    
     static func getContractList
     ( page:Int,
       resultsPerPage:Int,
         companyId: String,
         success: @escaping (_ response: ApiResult<ContactList>) -> (),
         fail: @escaping (ErrorApp) -> ()
     ){
         if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
         let url = "\(baseUrl)/billing/api/salerapp/contact/list"
         let api = ApiRequest(urlRequest: url, type: .get)
        api.params["companyId"] = companyId
         api.params["page"] = page
         api.params["results_per_page"] = resultsPerPage
             if let token = AppDelegate.shareDelegate.user?.token{
                 api.header = ["token": token, "Content-Type": "application/json"]
             }
         api.excuteWithObject(success: success, fail: fail)
         }
     }
    static func getProductBranch
    ( success: @escaping (_ response: ApiResultPaging<Product>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
        let url = "\(baseUrl)/billing/api/common/product"
        let api = ApiRequest(urlRequest: url, type: .get)
            if let token = AppDelegate.shareDelegate.user?.token{
                api.header = ["token": token, "Content-Type": "application/json"]
            }
        api.excuteWithObject(success: success, fail: fail)
        }
    }
   
    static func getProductService
    (productCode: String,
        success: @escaping (_ response: ApiResultPaging<Service>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
        let url = "\(baseUrl)/billing/api/salerapp/service/list"
        let api = ApiRequest(urlRequest: url, type: .get)
        api.params["productCode"] = productCode
            if let token = AppDelegate.shareDelegate.user?.token{
                api.header = ["token": token, "Content-Type": "application/json"]
            }
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    static func getInfoDeploy
    (productCode: String,
        success: @escaping (_ response: ApiResultPaging<Service>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
        let url = "\(baseUrl)/billing/api/salerapp/service/list"
        let api = ApiRequest(urlRequest: url, type: .get)
        api.params["productCode"] = productCode
            if let token = AppDelegate.shareDelegate.user?.token{
                api.header = ["token": token, "Content-Type": "application/json"]
            }
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    static func getListCustomerFilter
    (   textSearch: String?,
        status: String?,
        picSale: String?,
        picTeam: String?,
        picDept: String?,
        page: Int,
        sort: String?,
        picDateStart: String?,
        picDateEnd: String?,
        resultsPerPage: Int,
        success: @escaping (_ response: ApiResult<DataCustomer>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
            let url =  "\(baseUrl)/billing/api/customer/company/list"
            let api = ApiRequest(urlRequest:  url, type: .get)
            if let textSearch = textSearch,textSearch != "" {
                api.params["textSearch"] = textSearch
            }
            if let picSale = picSale,picSale != "--- Chọn tất cả ---"{
                api.params["picSale"] = picSale
            }
            if let picTeam = picTeam,picTeam != "--- Chọn tất cả ---"{
                api.params["picTeam"] = picTeam
            }
            if let status = status,status != "--- Chọn tất cả ---"{
                api.params["status"] = status
            }
            if let picDept = picDept,picDept != "--- Chọn tất cả ---"{
                api.params["picDept"] = picDept
            }
            api.params["sort"] = sort
            if let pickDatetrs = picDateStart,pickDatetrs != ""{
                api.params["createdTimeFrom"] = pickDatetrs
            }
            if let picDateEnd = picDateEnd,picDateEnd != ""{
                api.params["createdTimeTo"] = picDateEnd
            }
            
            
            api.params["page"] = page
            api.params["results_per_page"] = resultsPerPage
            if let token = AppDelegate.shareDelegate.user?.token{
                api.header = [
                    "token" : token,
                    "Content-Type": "application/json"
                ]
            }
            api.excuteWithObject(success: success, fail: fail)}
    }
    static func getConfigList
    (   token: String,
        success: @escaping (_ response: ApiResultPaging<Config>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
        let url =  "\(baseUrl)/billing/api/tool/config/list"
        let api = ApiRequest(urlRequest:  url, type: .get)
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    static func getDepartment
    (   token: String,
        success: @escaping (_ response: ApiResultPaging<Department>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
            let url =  "\(baseUrl)/billing/api/common/department"
            let api = ApiRequest(urlRequest:  url, type: .get)
            api.header = [
                "token" : token,
                "Content-Type": "application/json"
            ]
            api.excuteWithObject(success: success, fail: fail)
        }
       
        
    }
    
    static func getTeam
    (   token: String,
        deptCode: String,
        success: @escaping (_ response: ApiResultPaging<Team>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
        let url =  "\(baseUrl)/billing/api/common/team"
        let api = ApiRequest(urlRequest:  url, type: .get)
        //  api.params["deptCode"] = deptCode
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    
    static func getEployee
    (   role: String?,
        success: @escaping (_ response: ApiResultPaging<Employee>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
        let url =  "\(baseUrl)/billing/api/common/employee"
        let api = ApiRequest(urlRequest:  url, type: .get)
            if let role = role {
                api.params["role"] = role
            }
            if let token = AppDelegate.shareDelegate.user?.token{
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    
    }
    static func getBrand
    (   companyId: String?,
        success: @escaping (_ response: ApiResultPaging<Brand>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
        let url =  "\(baseUrl)/billing/api/common/brand"
        let api = ApiRequest(urlRequest:  url, type: .get)
            if let companyId = companyId {
                api.params["companyId"] = companyId
            }
            if let token = AppDelegate.shareDelegate.user?.token{
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    }
    static func getStore
    (
        brandId: String?,
        success: @escaping (_ response: ApiResultPaging<Store>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: "") {
        let url =  "\(baseUrl)/billing/api/common/store"
        let api = ApiRequest(urlRequest:  url, type: .get)

            if let brandId = brandId{
                api.params["brandId"] = brandId
            }

            if let token = AppDelegate.shareDelegate.user?.token{
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
        api.excuteWithObject(success: success, fail: fail)
        }
    
        }
    }
    
    static func searchListCustomer
    (
        page: Int,
        textSearch: String,
        token: String,
        resultsPerPage: Int,
        success: @escaping (_ response: ApiResult<DataCustomer>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
            
        
        let url =  "\(baseUrl)/billing/api/customer/company/list"
        let api = ApiRequest(urlRequest:  url, type: .get)
        api.params["page"] = page
        api.params["results_per_page"] = resultsPerPage
        api.params["textSearch"] = textSearch
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
            api.excuteWithObject(success: success, fail: fail)
        }
    }
    static func getLogin
    (   email: String,
        password: String,
        deviceId: String,
        success: @escaping (_ response: ApiResult<User>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
        let url = "\(baseUrl)/billing/api/auth/preLogin"
        let api = ApiRequest(urlRequest: url, type: .post)
        api.params["email"] = email
        api.params["password"] = password
        api.params["deviceId"] = deviceId
        api.header = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        api.excuteWithObject(success: success, fail: fail)
        }
    }
    static func loginWithToken
    (
        email: String,
        token: String,
        success: @escaping (_ response: ApiResult<User>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        if let baseUrl = (Bundle.main.infoDictionary?["baseURL"] as? String)?.replacingOccurrences(of: "\\", with: ""){
        let url = "\(baseUrl)/billing/api/auth/renew_token"
        let api = ApiRequest(urlRequest: url, type: .post)
        api.params["last_token"] = token
        api.params["email"] = email
        api.header = ["token": token, "Content-Type": "application/x-www-form-urlencoded"]
        api.excuteWithObject(success: success, fail: fail)
        }
    }
 
}
