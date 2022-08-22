//
//  DsCusVC.swift
//  iPOSBilling
//
//  Created by ipos on 19/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class DsCusVC: UIViewController {
    var custmerList: [Custumer] = []
    var searchName = [Custumer]()
    var searchData = false
    @IBOutlet weak var txtDskh: UILabel!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var seachBox: UISearchBar!
    @IBOutlet weak var seachView: UIView!
    @IBOutlet weak var tblDsCus: UITableView!
    override func viewDidLoad() {
        initData()
        super.viewDidLoad()
        let nib = UINib(nibName:"DsCusTVc", bundle: nil)
        tblDsCus.register(nib, forCellReuseIdentifier: "cell")
        tblDsCus.delegate = self
        tblDsCus.dataSource = self
        seachBox.delegate = self
        // Do any additional setup after loading the view.
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Action
    
    
    @IBAction func showSeachbox(_ sender: Any) {
        seachView.isHidden = false
        listView.isHidden = true
    }
    @IBAction func hideSeachbox(_ sender: Any) {
        seachView.isHidden = true
        listView.isHidden = false
    }
    func initData(){
        let id = ["1.", "2.", "3.", "4.", "5.", "6.", "7."]
        let date =  ["01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002"]
        let name = ["1/7", "1012_2@gmail", "1012_4", "1012_5", "1012_6", "1012_7s", "1012_7"]
        let code = ["AZV121212C", "ABC1231212", "UHA213127", "ABC1234", "CBA123", "ACC", "ASMK12341"]
        let lead = ["dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn"]
        let phone = ["01234567","1212312","41241212","0342300461","0342493201","0919320129","081927382"]
        for i in 0..<id.count {
            
            custmerList.append(Custumer(id: id[i], date: date[i], name: name[i], code: code[i], lead: lead[i],phone: phone[i],status: nil))
        }
        if(custmerList.isEmpty){
            
            showAlert(title: "Thông Báo", message: "Không có Dữ Liệu")
        }
        searchName = custmerList
    }
}
// MARK: - TABLEVIEW DELEGATE
extension DsCusVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
// MARK: - TABLEVIEW DATASORCE
extension DsCusVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! DsCusTVc
        let data = searchName[indexPath.row]
        cell.txtId.text =  data.id
        cell.txtName.text = data.name
        cell.txtCode.text = data.code
        cell.txtLead.text = data.lead
        cell.txtDate.text =  data.date
        cell.txtStatus.text = data.status
        txtDskh.text = "Danh sách khách hàng (" + String(describing: searchName.count)  + ")"
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchName.count
    }
}
// MARK: - SEARCHBOX DELETGATE
extension DsCusVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == "" ){
            searchName = custmerList;
        } else {
            searchName = custmerList.filter { (Custumer) -> Bool in
                return (Custumer.name.range(of: searchText, options: [ .caseInsensitive ]) != nil) || (Custumer.phone.range(of: searchText, options: [ .caseInsensitive ]) != nil)
            }
            if(searchName.isEmpty){
                showAlert(title: "Thông báo", message: "Không tìm thấy")
            }
        }
        self.tblDsCus.reloadData()
    }
}

