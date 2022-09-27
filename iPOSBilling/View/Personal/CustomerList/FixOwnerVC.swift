//
//  FixOwnerVC.swift
//  iPOSBilling
//
//  Created by ipos on 26/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import DropDown

class FixOwnerVC: UIViewController {

    @IBOutlet weak var labelShowTitle: UILabel!
    @IBOutlet weak var labelShowForm: UILabel!
    @IBOutlet weak var labelForm: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var viewForm: UIView!
    @IBOutlet weak var viewType: UIView!
    @IBOutlet weak var txtName: MDCOutlinedTextField!
    @IBOutlet weak var txtEmail: MDCOutlinedTextField!
    @IBOutlet weak var txtPhone: MDCOutlinedTextField!
    @IBOutlet weak var txtTitle: MDCOutlinedTextField!
    @IBOutlet weak var txtRepresent: MDCOutlinedTextField!
    @IBOutlet weak var txtTaxEmail: MDCOutlinedTextField!
    @IBOutlet weak var txtTaxCode: MDCOutlinedTextField!
    @IBOutlet weak var txtAddres: MDCOutlinedTextField!
    var customer: Customer?
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var labelCompanyName: UILabel!
    var dropDown = DropDown()
    var dropTypeData: [String] = ["Công ty","Cá Nhân"]
    var dropDown1 = DropDown()
    @IBOutlet weak var labelCompanyId: UILabel!
    var dropFormData: [String] = ["Nhượng quyền","Chủ chính"]
    var contactData: data?
    var tag = 0
    @IBOutlet weak var btnHuy: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initData()
        // Do any additional setup after loading the view.
    }
    func initData(){
        if let type = contactData?.contactType{
            labelShowTitle.isHidden = false
            if(type ==  "COMPANY"){
                labelType.text = "Công ty"
            } else{
                labelType.text = "Cá nhân"
            }
        }else {
            labelShowTitle.isHidden = true
            labelType.text = "Loại*"
        }
        
        if let onwerType = contactData?.onwerType{
            labelShowForm.isHidden = false
            switch onwerType {
            case "ROOT":
                labelForm.text = "Chủ chính"
            case "FRANCHISE":
                labelForm.text = "Nhượng quyền"
            default:
               break
            }
        } else{
            labelShowForm.isHidden = true
            labelForm.text = "Hình thức*"
        }
        if let companyID = customer?.companyId{
            labelCompanyId.text = "Company ID: \(companyID)"
        }
        if let companyName = customer?.name{
            labelCompanyName.text = companyName
        }
      
        if let companyName = contactData?.companyName{
            txtName.text = companyName
        }
        if let address = contactData?.address{
            txtAddres.text = address
        }
        if let taxCode = contactData?.taxCode{
            txtTaxCode.text = taxCode
        }
        if let taxEmail = contactData?.taxEmail{
            txtTaxEmail.text = taxEmail
        }
        if let name = contactData?.name{
            txtRepresent.text = name
        }
        if let title = contactData?.title{
            txtTitle.text = title
        }
        if let phone = contactData?.phone{
            txtPhone.text = phone
        }
        if let email = contactData?.email{
            txtEmail.text = email
        }
      
        
    }
    func setupView(){
        btnHuy.layer.cornerRadius = 5
        btnEdit.layer.cornerRadius = 5
        
        viewForm.layer.borderWidth = 1
        viewForm.layer.borderColor = UIColor.lightGray.cgColor
        viewForm.layer.cornerRadius = 5
        
        viewType.layer.borderWidth = 1
        viewType.layer.borderColor = UIColor.lightGray.cgColor
        viewType.layer.cornerRadius = 5
        
        txtName.label.text = "Tên Công ty*"
        txtName.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtName.setOutlineColor( .red , for: .disabled)
        txtName.setOutlineColor(.lightGray , for: .normal)
        
        txtAddres.label.text = "Địa Điểm*"
        txtAddres.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtAddres.setOutlineColor( .red , for: .disabled)
        txtAddres.setOutlineColor(.lightGray , for: .normal)
        
        txtTaxCode.label.text = "Mã số thuế*"
        txtTaxCode.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtTaxCode.setOutlineColor( .red , for: .disabled)
        txtTaxCode.setOutlineColor(.lightGray , for: .normal)
        
        txtTaxEmail.label.text = "Email Thuế*"
        txtTaxEmail.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtTaxEmail.setOutlineColor( .red , for: .disabled)
        txtTaxEmail.setOutlineColor(.lightGray , for: .normal)
        
        txtRepresent.label.text = "Đại diện*"
        txtRepresent.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtRepresent.setOutlineColor( .red , for: .disabled)
        txtRepresent.setOutlineColor(.lightGray , for: .normal)
        
        txtTitle.label.text = "Chức danh"
        txtTitle.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtTitle.setOutlineColor( .red , for: .disabled)
        txtTitle.setOutlineColor(.lightGray , for: .normal)
        
        txtPhone.label.text = "Số điện thoại"
        txtPhone.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtPhone.setOutlineColor( .red , for: .disabled)
        txtPhone.setOutlineColor(.lightGray , for: .normal)
        
        txtEmail.label.text = "Email"
        txtEmail.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        txtEmail.setOutlineColor( .red , for: .disabled)
        txtEmail.setOutlineColor(.lightGray , for: .normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func ActionBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func ActionType(_ sender: Any) {
        tag = 1
        action(dropDown: dropDown, value: dropTypeData)
        dropDown.anchorView = viewType
        dropDown.show()
    }
    
    @IBAction func ActionForm(_ sender: Any) {
        tag = 2
        action(dropDown: dropDown1, value: dropFormData)
        dropDown1.anchorView = viewForm
        dropDown1.show()
    }
    
    func action(dropDown : DropDown, value: [String])  {
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
    func checkFullData()->Bool{
        if (labelType.text == "" || labelForm.text == "" || txtName.text == "" || txtAddres.text == "" || txtTaxEmail.text == "" || txtTaxCode.text == "" || txtRepresent.text == "" || txtPhone.text == ""){
            return false
        }
        return true
    }
    @IBAction func ActionEdit(_ sender: Any) {
        if checkFullData() {
            let productVC = ProdcutVC(nibName: "ProdcutVC", bundle: nil)
            navigationController?.pushViewController(productVC, animated: true)
        } else{
            showArlet(title: "Thông báo", mess: "Chưa nhập đủ dữ liệu")
        }
    }
    @IBAction func ActionHuy(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func reloeadDataDropdown(){
        switch tag {
        case 2:
            labelShowForm.isHidden = false
            labelForm.text = dropDown1.selectedItem
        case 1:
            labelShowTitle.isHidden = false
            labelType.text = dropDown.selectedItem
        default:
            break
        }
    }
}
