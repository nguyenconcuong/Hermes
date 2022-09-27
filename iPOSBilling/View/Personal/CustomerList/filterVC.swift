//
//  filterVC.swift
//  iPOSBilling
//
//  Created by ipos on 25/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit
import DropDown
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class filterVC: UIViewController {
    //@IBOutlet weak var datePicker: UIDatePicker!
    
    var callBack:((_ filterData: Filter)->())?
    var tag = 0
    @IBOutlet weak var lbDateAgain: UILabel!
    @IBOutlet weak var lbDateTrs: UILabel!
    var user: User?
    var isLoading = false
    var fifterOf = ["ABC","theo thời gian tạo"]
    var teamList: [Team] = []
    var teamData: [String] = ["--- Chọn tất cả ---"]
    var statusData = ["--- Chọn tất cả ---","Đang hài lòng","Không hài lòng","Có ý định bỏ iPOS","Đã bỏ iPOS","Khác"]
    var deparmentList: [Department] = []
    var deparmentData: [String] = ["--- Chọn tất cả ---"]
    var employeeList: [Employee] = []
    var employeeData: [String] = ["--- Chọn tất cả ---"]
    var configList: [Config] = []
    var configData: [String] = ["--- Chọn tất cả ---"]
    var onBoarding: [String] = ["Tất cả trạng thái","đã gửi"]
    let datePicker = UIDatePicker()
    var dateStart: String?
    var dateAgain: String?
    var dateEnd: String?
    var filter: Filter?
    @IBOutlet weak var btnDefault: UIButton!
    @IBOutlet weak var btnAply: UIButton!
    @IBOutlet weak var textFieldDateStart: MDCOutlinedTextField!
    
    @IBOutlet weak var textFieldDateEnd: MDCOutlinedTextField!
    @IBOutlet weak var textReturnDate: MDCOutlinedTextField!
    
    @IBOutlet weak var viewRoom: UIView!
    @IBOutlet weak var DdAbc: UIView!
    @IBOutlet weak var txtAbc: UILabel!

    
    @IBOutlet weak var txtStatusValue: UILabel!
    @IBOutlet weak var txtStatus: UILabel!
    @IBOutlet weak var ViewStatus: UIView!
    
    
    @IBOutlet weak var txtValueDepartment: UILabel!
    @IBOutlet weak var txtDepartment: UILabel!
    @IBOutlet weak var viewDepartment: UIView!
    
    
    @IBOutlet weak var txtTeam: UILabel!
    @IBOutlet weak var viewTeam: UIView!
    @IBOutlet weak var txtValueTeam: UILabel!
    
    
    @IBOutlet weak var viewLead: UIView!
    @IBOutlet weak var txtValueLead: UILabel!
    
    
    @IBOutlet weak var valueOnboaring: UILabel!
    
    @IBOutlet weak var viewOnboarding: UIView!
    let dropDown = DropDown()
    let dropDown1 = DropDown()
    let dropDown2 = DropDown()
    let dropDown3 = DropDown()
    let dropDown4 = DropDown()
    let dropDown5 = DropDown()
    var status: [String] = []
    let room = ["Phòng kinh doanh","Phòng chiến lược","phòng doanh thu"]
    override func viewDidLoad() {
        setDefaultData()
        setupView()
        initData()
        super.viewDidLoad()
    }
    
    //MARK: Setup View
    func setupView(){
        btnAply.layer.cornerRadius = 8
        btnDefault.layer.cornerRadius = 8
        DdAbc.layer.borderWidth = 0.5
        DdAbc.layer.borderColor = UIColor.gray.cgColor
        DdAbc.layer.cornerRadius = 8
       
        viewRoom.layer.borderWidth = 0.5
        viewRoom.layer.borderColor = UIColor.gray.cgColor
        viewRoom.layer.cornerRadius = 8
        
        viewTeam.layer.borderWidth = 0.5
        viewTeam.layer.borderColor = UIColor.gray.cgColor
        viewTeam.layer.cornerRadius = 8
        
        viewLead.layer.borderWidth = 0.5
        viewLead.layer.borderColor = UIColor.gray.cgColor
        viewLead.layer.cornerRadius = 8
        
        ViewStatus.layer.borderWidth = 0.5
        ViewStatus.layer.borderColor = UIColor.gray.cgColor
        ViewStatus.layer.cornerRadius = 8
        
        viewDepartment.layer.borderWidth = 0.5
        viewDepartment.layer.borderColor = UIColor.gray.cgColor
        viewDepartment.layer.cornerRadius = 8
        
        viewOnboarding.layer.borderWidth = 0.5
        viewOnboarding.layer.borderColor = UIColor.gray.cgColor
        viewOnboarding.layer.cornerRadius = 8
        dropDown.selectRow(at: 1)
    
        textFieldDateStart.tag = 1
        textReturnDate.tag = 3
        textFieldDateEnd.tag = 2
        
        textFieldDateStart.label.text = "Ngày bất đầu chuyển đổi"
        textFieldDateStart.placeholder = "yyyy-MM-dd"
        textFieldDateStart.setOutlineColor(UIColor.lightGray, for: .normal)
        textFieldDateEnd.label.text = "Ngày kết thúc chuyển đổi"
        textFieldDateEnd.placeholder = "yyyy-MM-dd"
        textFieldDateEnd.setOutlineColor(UIColor.lightGray, for: .normal)
        textReturnDate.label.text = "Ngày trả lại"
        textReturnDate.placeholder = "yyyy-MM-dd"
        textReturnDate.setOutlineColor(UIColor.lightGray, for: .normal)
        
        createDatePicker(TextFieldDate: textReturnDate)
        createDatePicker(TextFieldDate: textFieldDateStart)
        createDatePicker(TextFieldDate: textFieldDateEnd)
        if(filter?.sortBy == "-createdTime") {
            txtAbc.text = fifterOf[1]
        } else{
            txtAbc.text = fifterOf[0]
        }
        if let pickStatus = filter?.pickStatus{
            txtStatusValue.text = pickStatus
        }
        if let pickTeam = filter?.pickTeam{
            txtValueTeam.text = pickTeam
        }
        if let pickDepartment = filter?.pickDept{
            txtValueDepartment.text = pickDepartment.name
        }
        if let pickSale = filter?.pickSale{
            txtValueLead.text = pickSale
        }
        if let pickDatetrs = filter?.pickDateStart{
            textFieldDateStart.text = pickDatetrs
        }
        if let pickDateAgain = filter?.picDateEnd{
            textFieldDateEnd.text = pickDateAgain
        }
        
    }
    func setDefaultData(){
        txtAbc.text = fifterOf[0]
        txtValueTeam.text = teamData[0]
        txtStatusValue.text = statusData[0]
        txtValueLead.text = employeeData[0]
        txtValueDepartment.text = deparmentData[0]
        valueOnboaring.text = onBoarding[0]
        textFieldDateStart.text = ""
        textReturnDate.text = ""
    }
    //MARK: Call API
    func initData(){
        isLoading = true
        user = AppDelegate.shareDelegate.user
        let token = user?.token
        if let token = token{
            ApiOperations.getConfigList(token: token) { resporn in
                if let a = resporn.data{
                    self.configList = a
                }
                self.isLoading = false
            } fail: { err in
                print(err)
                self.isLoading = false
            }
            ApiOperations.getDepartment(token: token) { resp in
                if let a = resp.data{
                    self.deparmentList = a
                    self.isLoading = false
                }
                for depart in self.deparmentList{
                    if let name = depart.name{
                        self.deparmentData.append(name)
                    }
                }
            } fail: { err in
                print(err)
            }
            ApiOperations.getTeam(token: token,deptCode: "") { resp in
                if let a = resp.data{
                    self.teamList = a
                    self.isLoading = false
                }
                for team in self.teamList{
                    if let name = team.name{
                        self.teamData.append(name)
                    }
                }
                
            } fail: { err in
                print(err)
                self.isLoading = false
            }
            
            ApiOperations.getEployee(role:"") { resp in
                if let a = resp.data{
                    self.employeeList = a
                    self.isLoading = false
                }
                for employee in self.employeeList{
                    if let email = employee.email{
                        self.employeeData.append(email)
                    }
                }
            } fail: { err in
                print(err)
                self.isLoading = false
            }
        }
        
    }
    //MARK: DatePicker
    func createDatePicker(TextFieldDate :UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donepressed(sender:)));
        doneButton.tag = TextFieldDate.tag
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        TextFieldDate.inputAccessoryView = toolbar
        TextFieldDate.inputView = datePicker
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            
        }
    }
    @objc func donepressed(sender: UIBarButtonItem) {
        let formatter = DateFormatter()

        if sender.tag == 1{
            formatter.dateFormat = "yyyy-MM-dd 00:00:00"
            textFieldDateStart.text = formatter.string(from: datePicker.date)
            dateStart = formatter.string(from: datePicker.date)
        } else {
            formatter.dateFormat = "yyyy-MM-dd 24:60:60s"
            textFieldDateEnd.text = formatter.string(from: datePicker.date)
            dateEnd = formatter.string(from: datePicker.date)
        }
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func action(dropDown : DropDown, value: [String])  {
        DropDown.appearance().selectedTextColor = UIColor.red
        dropDown.direction = .bottom
        dropDown.dataSource = value
        //  dropDown.cellNib = UINib(nibName: "MyCell", bundle: nil)
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
            txtAbc.text = dropDown.selectedItem
        case 2:
            txtStatusValue.text = dropDown1.selectedItem
        case 3:
            txtValueDepartment.text = dropDown2.selectedItem
        case 4:
            txtValueTeam.text = dropDown3.selectedItem
        case 5:
            txtValueLead.text = dropDown4.selectedItem
        case 6:
            valueOnboaring.text = dropDown5.selectedItem
        default:
            break
        }
        
    }
    
    // MARK: button Action
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDefault(_ sender: Any) {
       setDefaultData()
    }
    @IBAction func btnAply(_ sender: Any) {
        let team = teamList.first { team in
            if team.name == txtValueTeam.text {
                return true
            }
            return false
        }
        let sortBy: String
        if txtAbc.text == "ABC" {
            sortBy = "-name"
        } else {
            sortBy = "-createdTime"
        }
        let dept = deparmentList.first { dept in
            if dept.name ==  txtValueDepartment.text {
                return true
            }
            return false
        }
        let filter = Filter(sortBy: sortBy, pickStatus: txtStatusValue.text, pickSale: txtValueLead.text, pickTeam: txtValueTeam.text,pickTeamId: team?._id, pickDept:  dept  , pickDateStart: textFieldDateStart.text, picDateEnd: textFieldDateEnd.text, pickDepartment: txtValueDepartment.text)
        
        let DsCusVC = DsCusVC(nibName: "DsCusVC", bundle: nil)
          DsCusVC.filter = filter
          self.dismiss(animated: true, completion: nil)
         callBack?(filter)
    }
    @IBAction func btnDdAbc(_ sender: Any) {
        tag = 1
        dropDown.show()
        action(dropDown: dropDown, value: fifterOf)
        dropDown.anchorView = DdAbc
    }
    @IBAction func btnShowStatus(_ sender: Any) {
        tag = 2
        dropDown1.anchorView = ViewStatus
        dropDown1.show()
        action(dropDown: dropDown1, value: statusData)
    }
    @IBAction func btnRoom(_ sender: Any) {
        tag = 3
        dropDown2.anchorView = viewRoom
        dropDown2.show()
        action(dropDown: dropDown2, value: deparmentData)
    }
    @IBAction func btnShowTeam(_ sender: Any) {
        tag = 4
        action(dropDown: dropDown3, value: teamData)
        dropDown3.anchorView = viewTeam
        dropDown3.show()
    }
    
    @IBAction func btnShowLead(_ sender: Any) {
        tag = 5
        action(dropDown: dropDown4, value: employeeData)
        dropDown4.anchorView = viewLead
        dropDown4.show()
    }
    
    @IBAction func btnShowOnboarding(_ sender: Any) {
        tag = 6
        action(dropDown: dropDown5, value: onBoarding)
        dropDown5.anchorView = viewOnboarding
        dropDown5.show()
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

