//
//  CusVc.swift
//  iPOSBilling
//
//  Created by ipos on 25/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class CusVc: UIViewController {
    var Customer: Customer?
    var listTableCustomer: [ListTableData] = []
    var checkSection = true
    var checkSection1 = true
    var checkSection2 = true
    var checkSection3 = true
    @IBOutlet weak var txtId: UILabel!
    @IBOutlet weak var btnLeadDetail: UIButton!
    @IBOutlet weak var txtNameCus: UILabel!
    @IBOutlet weak var btncopy: UIButton!
    @IBOutlet var ViewTTKH: UIView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var tblCus: UITableView!
    override func viewDidLoad() {
        initData()
        super.viewDidLoad()
        setView()
        tblCus.rowHeight = UITableView.automaticDimension
        tblCus.estimatedRowHeight = 1000
        tblCus.dataSource = self
        tblCus.delegate = self
        let nib = UINib(nibName:"CusCell", bundle: nil)
        tblCus.register(nib, forCellReuseIdentifier: "cell")
        let nib1 = UINib(nibName:"RuleBuyCell", bundle: nil)
        tblCus.register(nib1, forCellReuseIdentifier: "cell1")
        let nib2 = UINib(nibName:"CustomerActionCell", bundle: nil)
        tblCus.register(nib2, forCellReuseIdentifier: "cell2")
        // Do any additional setup after loading the view.
    }
    func setView(){
        btnEdit.layer.cornerRadius = 15
        ViewTTKH.layer.borderWidth = 0.5
        btncopy.semanticContentAttribute = .forceRightToLeft
        btnLeadDetail.layer.cornerRadius = 7
        btnLeadDetail.titleLabel?.font = UIFont(name: "SFUIDisplay-Semibold", size: 14)
        btncopy.semanticContentAttribute = .forceRightToLeft
        txtNameCus.text = Customer?.name
        txtNameCus.font = UIFont(name: "SFUIDisplay-Semibold", size: 16)
        if let id = Customer?.companyId{
            txtId.text = "id: \(id)"
        }
      
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func initData(){
        var tableDataList: [TableData] = []
        if let name = Customer?.name{
            tableDataList.append(TableData(title: "tên công ty", value: name))
        }else {
            tableDataList.append(TableData(title: "tên công ty", value: ""))
        }
        if let address = Customer?.address{
            tableDataList.append(TableData(title: "Địa chỉ", value: address))
        }else{
            tableDataList.append(TableData(title: "Địa chỉ", value: "address"))
        }
        if let taxCode = Customer?.taxcode{
            tableDataList.append(TableData(title: "mã số thuế", value: taxCode))
        }else{
            tableDataList.append(TableData(title: "mã số thuế", value: ""))
        }
        if let taxEmail = Customer?.taxEmail{
            tableDataList.append(TableData(title: "email thuế", value: taxEmail))
        }else{
            tableDataList.append(TableData(title: "email thuế", value: ""))
        }
        if let contactName = Customer?.contactName{
            tableDataList.append(TableData(title: "Đại diện", value: contactName))
        }else{
            tableDataList.append(TableData(title: "Đại diện", value: ""))
        }
        if let contactTitle = Customer?.contactTitle{
            tableDataList.append(TableData(title: "Chức vụ", value: contactTitle))
        }else{
            
                tableDataList.append(TableData(title: "Chức vụ", value: ""))
        }
        if let contactPhone = Customer?.contactPhone{
            tableDataList.append(TableData(title: "số điện thoại", value: contactPhone))
        }else{
            
                tableDataList.append(TableData(title: "số điện thoại", value: ""))
        }
        if let contactEmail = Customer?.contactEmail{
            tableDataList.append(TableData(title: "Email", value: contactEmail))
        }else{
            tableDataList.append(TableData(title: "Email", value: ""))
        }
        if let facebook = Customer?.facebook{
            tableDataList.append(TableData(title: "facebook", value: facebook))
        }else{
            tableDataList.append(TableData(title: "facebook", value: ""))
        }
        listTableCustomer.append(ListTableData(title: "Thông tin sở hữu", tableData: tableDataList,eContracts: nil))
        
        tableDataList.removeAll()
        
        if let sourceGroup = Customer?.sourceGroup{
            tableDataList.append(TableData(title: "Nguồn tạo", value: sourceGroup ))
        }else{
            tableDataList.append(TableData(title: "Nguồn tạo", value: "" ))
        }
        if let name = Customer?.leadPartner?.name{
            tableDataList.append(TableData(title: "Đối tác", value: name))
        }else{
            
                tableDataList.append(TableData(title: "Đối tác", value: ""))
        }
        if let favoriteBy = Customer?.favoriteBy{
            var favorite = ""
            for i in 0..<favoriteBy.count{
                favorite.append(favoriteBy[i])
                favorite.append("\n")
            }
            tableDataList.append(TableData(title: "Yêu thích bởi", value: favorite))
        }else{
            
            tableDataList.append(TableData(title: "Yêu thích bởi", value: ""))
        }
        if let ownerSale = Customer?.ownerSale{
            tableDataList.append(TableData(title: "Người phụ trách", value: ownerSale))
        }else{
            
                tableDataList.append(TableData(title: "Người phụ trách", value: ""))
        }
        if let picSale = Customer?.picSale{
            tableDataList.append(TableData(title: "Người tạo", value: picSale))
        }else{
            tableDataList.append(TableData(title: "Người tạo", value: ""))
            
        }
        if let createdTime = Customer?.createdTime{
            tableDataList.append(TableData(title: "Ngày tạo", value: ConvertDate(date: createdTime)))
        }else{
            tableDataList.append(TableData(title: "Ngày tạo", value: ConvertDate(date: "")))

        }
        if let lastCareTime = Customer?.lastCareTime{
            tableDataList.append(TableData(title: "Chăm sóc lần cuối", value: lastCareTime))
        }else{
            tableDataList.append(TableData(title: "Chăm sóc lần cuối", value: ""))

        }
        if let contactEmail = Customer?.contactEmail{
            tableDataList.append(TableData(title: "Email", value: contactEmail))
        }else{
            tableDataList.append(TableData(title: "Email", value: ""))

        }
        if let status = Customer?.status{
            tableDataList.append(TableData(title: "Trạng thái", value: status))
        } else{
            tableDataList.append(TableData(title: "Trạng thái", value: ""))

        }
        tableDataList.append(TableData(title: "Sale ghi chú", value: ""))
        tableDataList.append(TableData(title: "Marketting ghi chú", value: ""))
        tableDataList.append(TableData(title: "Sale ghi chú", value: ""))
      
        listTableCustomer.append(ListTableData(title: "Thông tin Hỗ Trợ", tableData: tableDataList,eContracts: nil))
        if let eContractslist = Customer?.eContracts{
            listTableCustomer.append(ListTableData(title: "QUY ĐỊNH MUA HÀNG", tableData: nil, eContracts: eContractslist))
        }
        tableDataList.removeAll()
        tableDataList.append(TableData(title: "ic_care", value: "Chăm sóc"))
        tableDataList.append(TableData(title: "ic_create_bill", value: "Tạo phiếu yêu cầu"))
        tableDataList.append(TableData(title: "ic_create_bill", value: "Ví thanh toán"))
        tableDataList.append(TableData())
        tableDataList.append(TableData(title: "ic_ro_info", value: "Hoá đơn chưa hoàn thành"))
        tableDataList.append(TableData(title: "ic_service_expired", value: "Dịch vụ sắp hết hạn"))
        tableDataList.append(TableData())
        tableDataList.append(TableData(title: "ic_history_care", value: "Lịch sử chăm sóc"))
        tableDataList.append(TableData(title: "ic_history_payment", value: "Lịch sử hoá đơn"))
        tableDataList.append(TableData(title: "ic_history_payment", value: "Lịch sử yêu cầu"))
        tableDataList.append(TableData())
        tableDataList.append(TableData(title: "ic_brand", value: "Danh sách thương hiệu"))
        tableDataList.append(TableData(title: "ic_list_store", value: "Danh sách điểm bán hàng"))
        tableDataList.append(TableData(title: "ic_transfer_sale", value: "Chuyển đổi người phụ trách các điểm"))
        tableDataList.append(TableData(title: "ic_transfer_sale", value: "Chuyển đổi người phụ trách"))
        tableDataList.append(TableData(title: "ic_owner_list", value: "Danh sách chủ sở hữu"))
        listTableCustomer.append(ListTableData(title: "Tác vụ", tableData: tableDataList, eContracts: nil))
        
    }
    func ConvertDate(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let yourDate = formatter.date(from: date)
        formatter.dateFormat = "HH:mm, MM/dd/yyyy"
        return formatter.string(from: yourDate!)
    }
    @IBAction func btnEdit(_ sender: Any) {
        
    }
    @objc func handleAddButtonDidTap(button: UIButton) {
     
        button.setImage(UIImage(named: "ic_arrow_customer"), for: .normal)
           let section = button.tag
        switch section {
        case 0:
            checkSection = !checkSection
           
        case 1:
            checkSection1 = !checkSection1
        case 2:
            checkSection2 = !checkSection2
        case 3:
            if checkSection3 {
                button.setImage(UIImage(named: "ic_arrow_customer"), for: .normal)
            } else {
                button.setImage(UIImage(named: "ic_arrow_down"), for: .normal)
            }
            checkSection3 = !checkSection3
        default:
            break
        }
        tblCus.reloadData()
           //take care of reloading your tableView
        
    }
}

// MARK: - UITableViewDelegate
extension CusVc: UITableViewDelegate{
   

}
// MARK: - UITableViewDataSource
extension CusVc: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if !checkSection {
                return 0
            }
            return listTableCustomer[section].tableData?.count ?? 0
        case 1:
            if !checkSection1 {
                return 0
            }
            return listTableCustomer[section].tableData?.count ?? 0
        case 2:
            if !checkSection2 {
                return 0
            }
            return listTableCustomer[section].eContracts?.count ?? 0
        case 3:
            if !checkSection3 {
                return 0
            }
            return listTableCustomer[section].tableData?.count ?? 0
            
        default:
            return 0
        }

    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 25))
        if #available(iOS 13.0, *) {
            headerView.backgroundColor = UIColor.systemGray6
        } else {
            headerView.backgroundColor = UIColor.gray
        }
            let label = UILabel()
        let button = UIButton()
        button.setImage(UIImage(named: "ic_arrow_customer"), for: .normal)
        button.frame = CGRect.init(x: headerView.frame.width-50, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(handleAddButtonDidTap), for: .touchUpInside)
        button.tag = section
        label.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        label.font =  UIFont(name: "SFUIDisplay-Semibold", size: 15)
        label.frame = CGRect.init(x: 10, y: 10, width: headerView.frame.width-10, height: 20)
        label.text = listTableCustomer[section].title
            label.font = .systemFont(ofSize: 17)
            label.textColor = .darkGray
        headerView.addSubview(button)
            headerView.addSubview(label)
            return headerView
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 2:
            return 100
        case 3:
            if indexPath.row == 3{
                return 5
            }
            if indexPath.row == 6{
                return 5
            }
            if indexPath.row == 10{
                return 5
            }
            return 50
        default:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CusCell
            let tableData = listTableCustomer[indexPath.section].tableData
            cell.txtTitle.text = tableData?[indexPath.row].title
            cell.txtContent.text = tableData?[indexPath.row].value
           return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)as! RuleBuyCell
            let tableData = listTableCustomer[indexPath.section].eContracts
            cell.txtEmail.text = tableData?[indexPath.row].email
            if tableData?[indexPath.row].status == "ACTIVE"{
                cell.txtStatus.text = "Đã Gửi"
            } else {
                cell.txtStatus.text = "Chưa Gửi"
            }
            if let dateData = tableData?[indexPath.row].sendTime {
                  cell.txtDate.text = ConvertDate(date: dateData)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)as! CustomerActionCell
            let tableData = listTableCustomer[indexPath.section].tableData
            if let img = tableData?[indexPath.row].title{
                cell.img.image = UIImage(named: img)
                cell.txtAction.text = tableData?[indexPath.row].value
            }else{
                    cell.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1)
                cell.btnActon.isHidden = true
            }
            return cell
        }
       
    }
    
    
}
