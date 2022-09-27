//
//  InputDataVC.swift
//  iPOSBilling
//
//  Created by ipos on 21/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit
import DropDown
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class InputDataVC: UIViewController {
    @IBOutlet weak var btnContinueContract: RadioButton!
    @IBOutlet weak var viewRedContract: UIView!
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var ViewLobby: UIView!
    @IBOutlet weak var btnPickLead: UIButton!
    @IBOutlet weak var viewContractCode: UIView!
    @IBOutlet weak var viewLead: UIView!
    @IBOutlet weak var btnContractCode: RadioButton!
    @IBOutlet weak var txtPickLead: UILabel!
    @IBOutlet weak var textPartner: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyAmout: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyPhone: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyName: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyBankName: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyOwnerBankName: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyNote: MDCOutlinedTextField!
    @IBOutlet weak var textLobbyNumOfBank: MDCOutlinedTextField!
    @IBOutlet weak var companyID: UILabel!

    @IBOutlet weak var labelInfo: UILabel!
    var arrayString: [String] = []
    var infoData: [Config]?
    var amt: Int = 0
    var customer: Customer?
    let dropDown = DropDown()
    var contactList: [data] = []
    var pickLeadData: [String] = []
    var isDataOwner = true
    var contactData: data?
    var isLobbyPartner = false
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var textContractCode: MDCOutlinedTextField!
    var isNewContract = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
        // Do any additional setup after loading the view.
    }

    func setupView(){
        
        textContractCode.label.text = "Mã HĐ đã kí"
     
        textContractCode.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textContractCode.setOutlineColor( .red , for: .disabled)
        textContractCode.setOutlineColor(.lightGray , for: .normal)

        textPartner.label.text = "Đối tác giới thiệu"
        textPartner.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textPartner.setOutlineColor( .red , for: .disabled)
        textPartner.setOutlineColor(.lightGray , for: .normal)
        textPartner.isUserInteractionEnabled = false
        
        textLobbyAmout.label.text = "(đ)Số tiền trích*"
        textLobbyAmout.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyAmout.setOutlineColor( .red , for: .disabled)
        textLobbyAmout.setOutlineColor(.lightGray , for: .normal)
        textLobbyAmout.delegate = self
        
        
        textLobbyPhone.label.text = "Số điện thoại*"
        textLobbyPhone.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyPhone.setOutlineColor( .red , for: .disabled)
        textLobbyPhone.setOutlineColor(.lightGray , for: .normal)
        
        textLobbyName.label.text = "Tên liên hệ*"
        textLobbyName.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyName.setOutlineColor( .red , for: .disabled)
        textLobbyName.setOutlineColor(.lightGray , for: .normal)
        
        
        textLobbyBankName.label.text = "Tên ngân hàng*"
        textLobbyBankName.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyBankName.setOutlineColor( .red , for: .disabled)
        textLobbyBankName.setOutlineColor(.lightGray , for: .normal)
        
        
        textLobbyOwnerBankName.label.text = "Chủ tài khoản(ngân hàng)*"
        textLobbyOwnerBankName.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyOwnerBankName.setOutlineColor( .red , for: .disabled)
        textLobbyOwnerBankName.setOutlineColor(.lightGray , for: .normal)
        
        
        textLobbyNumOfBank.label.text = "Số tài khoản(ngân hàng)"
        textLobbyNumOfBank.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyNumOfBank.setOutlineColor( .red , for: .disabled)
        textLobbyNumOfBank.setOutlineColor(.lightGray , for: .normal)
        
        
        textLobbyNote.label.text = "Ghi chú về đối tác*"
        textLobbyNote.setOutlineColor( UIColor(red: 0.02, green: 0.38, blue: 0.65, alpha: 1.00), for: .editing)
        textLobbyNote.setOutlineColor( .red , for: .disabled)
        textLobbyNote.setOutlineColor(.lightGray , for: .normal)
        
        companyName.text = customer?.name ?? "nil"
     
        companyID.text = "Company ID: \(customer?.companyId ?? "")"
        viewLead.layer.borderWidth = 1
        viewLead.layer.borderColor = UIColor.lightGray.cgColor
        viewLead.layer.cornerRadius = 5
        viewContractCode.isHidden = true
        btnContractCode.isSelected = true
        btnContinueContract.isSelected = false
        ViewLobby.isHidden = true
       viewInfo.isHidden = true
        labelInfo.sizeToFit()
    }

   
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    //  let newString = (text as NSString).replacingCharacters(in: range, with: string)
    //. format(with: "+X (XXX) XXX-XXXX", phone: newString)
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnNewContract(_ sender: UIButton) {
        if !sender.isSelected{
            sender.isSelected = true
            self.isNewContract = false
            viewContractCode.isHidden = true
            btnContinueContract.isSelected = false
        }
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
    func reloeadDataDropdown(){
        self.isDataOwner = false
        contactData = contactList[dropDown.indexForSelectedRow ?? -1]
        txtPickLead.text = dropDown.selectedItem
        if let type = contactData?.contactType{
            if(type ==  "COMPANY"){
                arrayString.append("Loại: Công ty")
            } else{
                arrayString.append("Loại: Cá nhân")
            }
           
        } else{
            self.isDataOwner = true
        }
        arrayString.append("Tên: \(contactData?.name ?? "")")
        
        
        if let onwerType = contactData?.onwerType{
            switch onwerType {
            case "ROOT":
                arrayString.append("Hình thức: Chủ chính")
            case "FRANCHISE":
                arrayString.append("Hình thức: Nhượng quyền")
            default:
                arrayString.append("Hình thức:")
            }
        
        } else{
            self.isDataOwner = true
        }
        var taxCodeValue = ""
        if let taxCode = contactData?.taxCode{
            taxCodeValue = taxCode
        }  else{
            self.isDataOwner = true
        }
        arrayString.append("Mã số thuế: \(taxCodeValue)")
        
        var emailValue = ""
        if let email = contactData?.taxEmail{
            emailValue = email
        }  else{
            self.isDataOwner = true
        }
        arrayString.append("Email công ty: \(emailValue)")
        
        var addressValue = ""
        if let address = contactData?.address{
            addressValue = address
        }  else{
            self.isDataOwner = true
        }
        arrayString.append("Địa chỉ kí trong HĐ:\(addressValue)")
        
        var nameValue = ""
        if let name = contactData?.name{
            nameValue = name
        }  else{
            self.isDataOwner = true
        }
        arrayString.append( "Người đại diện:\(nameValue)")
        
        if let phone = contactData?.phone{
           
        }else{
            self.isDataOwner = true
        }
          
        arrayString.append("Chức vụ:\(contactList[dropDown.indexForSelectedRow ?? -1].title ?? "")")
        labelInfo.font = UIFont.systemFont(ofSize: 15)
        var value = ""
        for data in arrayString {
            value = value + " • " + data + "\n"
         }
        labelInfo.text = value
        viewRedContract.isHidden = true
        viewInfo.isHidden = false
        arrayString.removeAll()
    }

    @IBAction func btnActionPickLead(_ sender: Any){
        self.pickLeadData.removeAll()
        showUniversalLoadingView(show: true, loadingText: "Đang xử lý")
        if let companyId = customer?.companyId{
            ApiOperations.getContractList(page: 1, resultsPerPage: 20, companyId: companyId) { respone in
                if let a = respone.data?.data{
                    for content in a {
                        self.contactList.append(content)
                        if let name = content.name{
                            self.pickLeadData.append(name)
                        }
                    }
                } else {
              
                }
                self.action(dropDown: self.dropDown, value: self.pickLeadData)
                self.dropDown.anchorView = self.viewLead
                self.dropDown.show()
                self.showUniversalLoadingView(show: false)
            } fail: { err in
                self.showUniversalLoadingView(show: false)
                self.showArlet(title: "Thông Báo", mess: err.getMessage())
            }
        }
    }
    @IBAction func btnContinueContract(_ sender: UIButton) {
        if !sender.isSelected{
            btnContractCode.isSelected = false
            sender.isSelected = true
            self.isNewContract = false
            viewContractCode.isHidden = false
        }
    }
    
    @IBAction func btnActionLobby(_ sender: UIButton) {
        if !sender.isSelected{
            isLobbyPartner = true
            sender.isSelected = true
            ViewLobby.isHidden = false
        } else{
            isLobbyPartner = false
            sender.isSelected = false
            ViewLobby.isHidden = true
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
            navigationController?.popViewController(animated: true)
    }
    @IBAction func btnActionRedContract(_ sender: UIButton) {
        if !sender.isSelected{
            sender.isSelected = true
        } else{
            sender.isSelected = false
        }
    }
    @IBAction func btnActionSendMail(_ sender: UIButton) {
        if !sender.isSelected{
            sender.isSelected = true
        } else{
            sender.isSelected = false
        }
    }
    @IBAction func btnActionPapleContract(_ sender: UIButton) {
        if !sender.isSelected{
            sender.isSelected = true
        } else{
            sender.isSelected = false
        }
    }
    @IBAction func btnPickProduct(_ sender: Any) {
        if !isDataOwner{
        let productVC = ProdcutVC(nibName: "ProdcutVC", bundle: nil)
            productVC.customer = customer
        navigationController?.pushViewController(productVC, animated: true)
        } else{
            showArletInputData(title: "Thông báo", mess: "Thông tin chủ sở hữu chưa đầy đủ, bạn có muốn cập nhật lại thông tin chủ sử hữu không")
        }
    }
    func checkLobbyPartner(){
        //if (textLobbyName == "" ||text)
        
    }
    func showArletInputData(title: String, mess: String){
        let alert = UIAlertController(title: title, message: mess, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler: {_ in
            let fixOwnerVC = FixOwnerVC(nibName: "FixOwnerVC", bundle: nil)
            fixOwnerVC.customer = self.customer
            fixOwnerVC.contactData = self.contactData
            self.navigationController?.pushViewController(fixOwnerVC, animated: true)
        } ))
        // show the alert
        present(alert, animated: true, completion: nil)
    }


}
extension InputDataVC:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let digit = Int(string){
            amt = amt * 10 + digit
            textField.text = updateAmout()
        }
        if string == ""{
            amt = amt/10
            textField.text = updateAmout()
        }
        return false
    }
    func updateAmout()->String?{
        let formater = NumberFormatter()
        formater.locale = Locale(identifier: "vi_VN")
        formater.numberStyle = NumberFormatter.Style.currency
        let amout = Double(amt/100)+Double(amt%100)/100
        return formater.string(from: NSNumber(value: amout))
    }

}

