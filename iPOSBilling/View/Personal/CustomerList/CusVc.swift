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
    @IBOutlet weak var txtId: UILabel!
    @IBOutlet weak var txtNameCus: UILabel!
    @IBOutlet weak var btncopy: UIButton!
    @IBOutlet var ViewTTKH: UIView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var tblCus: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tblCus.dataSource = self
        tblCus.delegate = self
        let nib = UINib(nibName:"CusCell", bundle: nil)
        tblCus.register(nib, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    func setView(){
        btnEdit.layer.cornerRadius = 15
        ViewTTKH.layer.borderWidth = 0.5
        btncopy.semanticContentAttribute = .forceRightToLeft
        txtNameCus.text = Customer?.name
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

}
// MARK: - UITableViewDelegate
extension CusVc: UITableViewDelegate{
    
}
// MARK: - UITableViewDataSource
extension CusVc: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CusCell
        switch indexPath.row {
        case 0:
            cell.txtTitle.text = "tên công ty"
            if let name = Customer?.name{
                cell.txtContent.text = name
            }else {
                cell.txtContent.text = ""
            }
        
            cell.btnCopy.isHidden = true
        case 1:
            cell.txtTitle.text = "Địa chỉ"
            if let address = Customer?.address{
                cell.txtContent.text = address
            }else {
                cell.txtContent.text = ""
            }
          
        case 2:
            cell.txtTitle.text = "mã số thuế"
            if let taxcode = Customer?.taxcode{
                cell.txtContent.text = taxcode
            }else {
                cell.txtContent.text = ""
            }
            
            cell.btnCopy.isHidden = true
        case 3:
            cell.txtTitle.text = "email thuế"
            if let emailtax = Customer?.taxEmail{
                cell.txtContent.text = emailtax
            }else {
                cell.txtContent.text = ""
            }
            
        case 4:
            cell.txtTitle.text = "Đại diện"
            if let contactName = Customer?.contactName{
                cell.txtContent.text = contactName
            }else {
                cell.txtContent.text = ""
            }
            cell.btnCopy.isHidden = true
        case 5:
            cell.txtTitle.text = "Chức vụ"
            if let contactTitle = Customer?.contactTitle{
                cell.txtContent.text = contactTitle
            }else {
                cell.txtContent.text = ""
            }
            cell.btnCopy.isHidden = true
        case 6:
            cell.txtTitle.text = "số điện thoại"
            if let contactPhone = Customer?.contactPhone{
                cell.txtContent.text = contactPhone
            }else {
                cell.txtContent.text = ""
            }
        case 7:
            cell.txtTitle.text = "Email"
            if let contactEmail = Customer?.contactEmail{
                cell.txtContent.text = contactEmail
            }else {
                cell.txtContent.text = ""
            }
        case 8:
            cell.txtTitle.text = "facebook"
            if let contactFacebook = Customer?.contactFacebook{
                cell.txtContent.text = contactFacebook
            }else {
                cell.txtContent.text = ""
            }
        default:
            break
        }
        return cell
    }
    
    
}
