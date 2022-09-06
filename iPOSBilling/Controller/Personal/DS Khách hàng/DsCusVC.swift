//
//  DsCusVC.swift
//  iPOSBilling
//
//  Created by ipos on 19/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit
import QNRequest

class DsCusVC: UIViewController {
    var isFulldata = false
    var isLoading = false
    var isSearch = false
    var user: User?
    var page = 1
    var id = 1
    var count = 0
    var textSearch = ""
    var custmerList: [Customer] = []
    @IBOutlet weak var txtDskh: UILabel!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var seachBox: UISearchBar!
    @IBOutlet weak var seachView: UIView!
    @IBOutlet weak var tblDsCus: UITableView!
    @IBOutlet weak var viewNodata: UIView!
    @IBOutlet weak var txtNodata: UILabel!
    @IBOutlet weak var imgNodata: UIImageView!
    override func viewDidLoad() {
        checkData(status: false)
        initData(page: page)
        super.viewDidLoad()
        setView()
        let nib = UINib(nibName:"DsCusTVc", bundle: nil)
        tblDsCus.register(nib, forCellReuseIdentifier: "cell")
        let tableViewLoadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
        self.tblDsCus.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingcellid")
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
    func checkData(status: Bool) {
        tblDsCus.isHidden = status
        viewNodata.isHidden = !status
    }
    func setView() {
        self.txtDskh.text = "Danh sách khách hàng "
    }
    
    func initData(page: Int){
        
        if(isSearch){
            self.custmerList.removeAll()
            self.page = 1
        }
        user = AppDelegate.shareDelegate.user
        let token = user?.token
        if let token = token{
            ApiOperations.getListCustomer(textSearch: textSearch,page: page, token: token , resultsPerPage: 100) { respone in
                if let a = respone.data?.companies{
                    self.custmerList.append(contentsOf: a)
                    if let count = respone.data?.count{
                        self.count = count
                        self.txtDskh.text = "Danh sách khách hàng (" + String(describing: count)  + ")"
                    }
                }
                self.isFulldata = false
                self.isLoading = false
                self.tblDsCus.reloadData()
            } fail: { error in
                self.showArlet(title: "Thông báo", mess: error.getMessage())
                //self.checkData(status: true)
                //  self.isLoading = false
                self.loadMoreData()
            }
        }
        
    }
    
}
// MARK: - TABLEVIEW DELEGATE
extension DsCusVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150.0
        } else {
            return 55
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let CusVc = CusVc(nibName: "CusVc", bundle: nil)
        CusVc.Customer = custmerList[indexPath.row]
        self.present(CusVc, animated: true)
    }
    
}
// MARK: - TABLEVIEW DATASORCE
extension DsCusVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! DsCusTVc
            cell.txtId.text = String(indexPath.row + 1) + "."
            if custmerList.count != 0 {
                let data = custmerList[indexPath.row]
                if let name = data.name{
                    cell.txtName.text = name
                }else {
                    cell.txtName.text = ""
                }
                if let companyid = data.companyId{
                    cell.txtCode.text = companyid
                }
                else{
                    cell.txtCode.text = ""
                }
                if let picSale = data.picSale{
                    cell.txtLead.text = picSale
                }else {
                    cell.txtLead.text = ""
                }
                if let maptime = data.mapTime{
                    cell.txtDate.text =  maptime
                }else {
                    cell.txtDate.text =  ""
                }
                
            }
           
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingcellid", for: indexPath) as! LoadingCell
            if !isFulldata{
                cell.activityIndicator.isHidden = false
                cell.activityIndicator.startAnimating()
            }else {
                cell.activityIndicator.isHidden = true
                cell.activityIndicator.stopAnimating()
            }
            
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if custmerList.count == 0{
                checkData(status: true)
                page = 1
            }else {
                checkData(status: false)
            }
            if count == custmerList.count{
                isFulldata = true
            }
            return custmerList.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == custmerList.count - 1, !isLoading, !isFulldata {
            loadMoreData()
        }
    }
    func loadMoreData(){
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
                self.page = self.page+1
                if (self.user?.token) != nil{
                    self.initData(page: self.page)
                }
                
            }
        }
    }
}

// MARK: - SEARCHBOX DELETGATE
extension DsCusVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !isSearch {
            isSearch = true
            self.textSearch = searchBar.text ?? ""
            initData(page: page)
        }
        if textSearch == ""{
            page = 1
        }
        isSearch = false
       
    }
}


