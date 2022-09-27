//
//  InfoDeployVC.swift
//  iPOSBilling
//
//  Created by ipos on 27/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import DropDown
class InfoDeployVC: UIViewController {
    @IBOutlet weak var labelSale: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelDeployPoint: UILabel!
    @IBOutlet weak var viewTypeDeploy: UIView!
    @IBOutlet weak var viewExport: UIView!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewDeployPoint: UIView!
    @IBOutlet weak var viewSale: UIView!
    @IBOutlet weak var viewBrand: UIView!
    @IBOutlet weak var txtNote: MDCOutlinedTextField!
    @IBOutlet weak var labelTypeDeploy: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelExport: UILabel!
    @IBOutlet weak var viewDopdownExport: UIView!
    @IBOutlet weak var txtReceivingaddress: MDCOutlinedTextField!
    @IBOutlet weak var txtDateDeploy: MDCOutlinedTextField!
    @IBOutlet weak var txtDeployPoint: MDCOutlinedTextField!
    var dropDownSale = DropDown()
    var dropDownBrand = DropDown()
    var dropDownStore = DropDown()
    var tag = 0
    var brandList: [Brand] = []
    var brandSelect:Brand?
    var customer: Customer?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    func setupView(){
        txtNote.label.text = "Ghi chú triển khai"
        txtNote.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtNote.setOutlineColor( .red , for: .disabled)
        txtNote.setOutlineColor(.lightGray , for: .normal)
        
        txtDateDeploy.label.text = "Ngày dự kiến triển khai"
        txtDateDeploy.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtDateDeploy.setOutlineColor( .red , for: .disabled)
        txtDateDeploy.setOutlineColor(.lightGray , for: .normal)    
        
        txtDeployPoint.label.text = "Điểm triển khai"
        txtDeployPoint.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtDeployPoint.setOutlineColor( .red , for: .disabled)
        txtDeployPoint.setOutlineColor(.lightGray , for: .normal)
        
        txtReceivingaddress.label.text = "Địa chỉ nhận"
        txtReceivingaddress.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtReceivingaddress.setOutlineColor( .red , for: .disabled)
        txtReceivingaddress.setOutlineColor(.lightGray , for: .normal)

        viewCity.layer.borderWidth = 1
        viewCity.layer.borderColor = UIColor.lightGray.cgColor
        viewCity.layer.cornerRadius = 5
        
        viewSale.layer.borderWidth = 1
        viewSale.layer.borderColor = UIColor.lightGray.cgColor
        viewSale.layer.cornerRadius = 5
        
        viewBrand.layer.borderWidth = 1
        viewBrand.layer.borderColor = UIColor.lightGray.cgColor
        viewBrand.layer.cornerRadius = 5
        
        viewDopdownExport.layer.borderWidth = 1
        viewDopdownExport.layer.borderColor = UIColor.lightGray.cgColor
        viewDopdownExport.layer.cornerRadius = 5
        
        viewCountry.layer.borderWidth = 1
        viewCountry.layer.borderColor = UIColor.lightGray.cgColor
        viewCountry.layer.cornerRadius = 5
        
        viewTypeDeploy.layer.borderWidth = 1
        viewTypeDeploy.layer.borderColor = UIColor.lightGray.cgColor
        viewTypeDeploy.layer.cornerRadius = 5
        
        viewDeployPoint.layer.borderWidth = 1
        viewDeployPoint.layer.borderColor = UIColor.lightGray.cgColor
        viewDeployPoint.layer.cornerRadius = 5
        labelSale.text = AppDelegate.shareDelegate.user?.email
    }
    @IBAction func ActionBrand(_ sender: Any) {
        tag = 2
        brandList.removeAll()
        var brandData: [String] = ["Thương hiệu mới"]
        showUniversalLoadingView(show: true, loadingText: "Đang xử lý")
        ApiOperations.getBrand(companyId: customer?.companyId) { responds in
            if let a = responds.data{
                self.brandList = a
                for brand in a {
                    if let brandId = brand.brandId, let brandName = brand.name{
                        brandData.append("\(brandId)(\(brandName))")
                    }
                    
                }
            }
            self.action(dropDown: self.dropDownBrand, value: brandData)
            self.dropDownBrand.anchorView = self.viewBrand
            self.dropDownBrand.show()
            self.showUniversalLoadingView(show: false)
        } fail: { err in
            self.showUniversalLoadingView(show: false)
            self.showArlet(title: "Lỗi", mess: err.getMessage())
        }

    }
    
    @IBAction func ActionPickSale(_ sender: Any) {
        tag = 1
        var saleData:[String] = []
        showUniversalLoadingView(show: true, loadingText: "Đang xử lý")
        ApiOperations.getEployee( role: "SALEMAN") { resporn in
            if let a = resporn.data {
                for emp in a {
                    if let email = emp.email{
                        saleData.append(email)
                    }
                }
                self.action(dropDown: self.dropDownSale, value: saleData)
                self.dropDownSale.anchorView = self.viewSale
                self.dropDownSale.show()
            }
            self.showUniversalLoadingView(show: false)
        } fail: { err in
            self.showUniversalLoadingView(show: false)
            self.showArlet(title: "Lỗi", mess: err.getMessage())
        }
      
    }
    func action(dropDown : DropDown, value: [String]){
        DropDown.appearance().selectedTextColor = UIColor.red
        dropDown.direction = .bottom
        dropDown.dataSource = value
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            reloeadDataDropdown()
        }
        dropDown.cancelAction = { [unowned self] in
            print("Drop down dismissed")
        }
    }
    func reloeadDataDropdown(){
        switch tag {
        case 1:
            labelSale.text = dropDownSale.selectedItem
          
        case 2:
            brandSelect = nil
          labelBrand.text = dropDownBrand.selectedItem
            if let index = dropDownBrand.indexForSelectedRow{
                if index > 0{
                    brandSelect = brandList[index-1]
                }
                    labelDeployPoint.text = ""
            }
        case 3:
            labelDeployPoint.text = dropDownStore.selectedItem
        default:
            break
        }
       
    }
    @IBAction func ActionDeployPoint(_ sender: Any) {
        tag = 3
        var storeData:[String] = ["Điểm áp dụng mới"]
        var brandId:String = ""
       
        brandId = brandSelect?.brandId ?? ""
        
       
        ApiOperations.getStore(brandId: brandId) { res in
            if let a = res.data {
                for store in a {
                    if let storeId = store.storeId, let name = store.name, let brand = self.brandSelect{
                        storeData.append("\(String(storeId))(\(name))")
                    }
                    self.action(dropDown: self.dropDownStore, value: storeData)
                    self.dropDownStore.anchorView = self.viewDeployPoint
                    self.dropDownStore.show()
                }
            }
        } fail: { err in
            self.showArlet(title: "Lỗi", mess: err.getMessage())
        }
        
    }
    @IBAction func ActionBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func CheckBoxDeploy(_ sender: UIButton) {
        if !sender.isSelected{
            sender.isSelected = true
            txtDeployPoint.text = customer?.address
            txtDeployPoint.isUserInteractionEnabled = false
        } else{
            txtDeployPoint.isUserInteractionEnabled = true
            sender.isSelected = false
        }
    }
    @IBAction func ActionCity(_ sender: Any) {
    }
    @IBAction func ActionCountry(_ sender: Any) {
    }
    
    @IBAction func ActionExport(_ sender: Any) {
    }
    @IBAction func CheckBoxDeploy1(_ sender: Any) {
    }
    @IBAction func ActionTypeDeploy(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
