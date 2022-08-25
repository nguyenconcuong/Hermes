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
    (
        page: Int,
        token: String,
        resultsPerPage: Int,
        success: @escaping (_ response: ApiResult<DataCustomer>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        let baseurl = AppDelegate.shareDelegate.baseurl
        let url =  "\(baseurl)/billing/api/customer/company/list"
        let api = ApiRequest(urlRequest:  url, type: .get)
        api.params["page"] = page
        api.params["results_per_page"] = resultsPerPage
        api.header = [
            "token" : token,
            "Content-Type": "application/json"
        ]
        api.excuteWithObject(success: success, fail: fail)
    }
    static func getLogin
    (   email: String,
        password: String,
        deviceId: String,
        success: @escaping (_ response: ApiResult<User>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        let baseurl = AppDelegate.shareDelegate.baseurl
        let url = "\(baseurl)/billing/api/auth/preLogin"
        let api = ApiRequest(urlRequest: url, type: .post)

        api.params["email"] = email
        api.params["password"] = password
        api.params["deviceId"] = deviceId
        api.header = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        api.excuteWithObject(success: success, fail: fail)
    }
    static func loginWithToken
    (
        email: String,
        token: String,
        success: @escaping (_ response: ApiResult<User>) -> (),
        fail: @escaping (ErrorApp) -> ()
    ){
        let baseurl = AppDelegate.shareDelegate.baseurl
        let url = "\(baseurl)/billing/api/auth/renew_token"
        let api = ApiRequest(urlRequest: url, type: .post)

        api.params["last_token"] = token
        api.params["email"] = email
        api.header = ["token": token, "Content-Type": "application/x-www-form-urlencoded"]
        
        api.excuteWithObject(success: success, fail: fail)
    }
}
