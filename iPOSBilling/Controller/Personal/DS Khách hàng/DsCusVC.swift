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
    @IBOutlet weak var loadingActiviti: UIActivityIndicatorView!
    @IBOutlet weak var loaddingView: UIView!
    var isFulldata = false
    var isLoading = false
    var isSearch = false
    var countTag = 0
    var user: User?
    var page = 1
    var id = 1
    var headerview: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 30),collectionViewLayout:  UICollectionViewFlowLayout())
    var count = 0
    var totalCount = 0
    var textSearch = ""
    var custmerList: [Customer] = []
    var filter = Filter()
    var tagArray: [String] = []
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    @IBOutlet weak var txtDskh: UILabel!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var seachBox: UISearchBar!
    @IBOutlet weak var seachView: UIView!
    @IBOutlet weak var tblDsCus: UITableView!
    @IBOutlet weak var viewNodata: UIView!
    @IBOutlet weak var txtNodata: UILabel!
    @IBOutlet weak var imgNodata: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData(page: page)
        checkData(status: false)
        configHeaderView()
        showLoadingView(loading: true)
        setView()
        let nib = UINib(nibName:"DsCusTVc", bundle: nil)
        tblDsCus.register(nib, forCellReuseIdentifier: "cell")
        let nib1 = UINib(nibName:"CollectionTagViewCell", bundle: nil)
        tblDsCus.register(nib1, forCellReuseIdentifier: "tagCell")
        let tableViewLoadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
        self.tblDsCus.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingcellid")
        tblDsCus.delegate = self
        tblDsCus.dataSource = self
        seachBox.delegate = self
        self.tblDsCus.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    func configHeaderView(){
        self.tagArray = filter.getDataToArray()
        (headerview.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        (headerview.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        headerview.isPagingEnabled = true
        headerview.isUserInteractionEnabled = true
        headerview.backgroundColor = UIColor.white
        headerview.dataSource = self
        headerview.delegate = self
        let nibTag = UINib(nibName:"TagCell", bundle: nil)
        headerview.register(nibTag, forCellWithReuseIdentifier: "TagCell")
        headerview.showsHorizontalScrollIndicator = false
        tblDsCus.tableHeaderView = headerview
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

    @IBAction func btnbtnFilter(_ sender: Any) {
        let filterVC = filterVC(nibName: "filterVC", bundle: nil)
        filterVC.filter = filter
        filterVC.callBack = { filter in
            self.filter = filter
            self.isSearch = true
            self.page = 1
            self.initData(page: self.page)
            self.tagArray = filter.getDataToArray()
            self.headerview.reloadData()
            self.isSearch = false
        }
        filterVC.modalPresentationStyle = .fullScreen
        self.present(filterVC, animated: true)
    }
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
    func showLoadingView(loading: Bool){
        if loading{
            loaddingView.isHidden = false
            loadingActiviti.startAnimating()
        } else{
            loaddingView.isHidden = true
            loadingActiviti.stopAnimating()
        }
    }
    
    func initData(page: Int){
        if(isSearch){
            self.custmerList.removeAll()
            self.page = 1
            self.totalCount = 0
        }
        if !self.isLoading{
        self.isLoading = true
        ApiOperations.getListCustomerFilter(textSearch:textSearch,
                                            status: filter.pickStatus,
                                            picSale: filter.pickSale,
                                            picTeam: filter.pickTeamId,
                                            picDept: filter.pickDept?.code,
                                            page: page,
                                            sort: filter.sortBy,
                                            picDateStart: filter.pickDateStart,
                                            picDateEnd: filter.picDateEnd ,
                                            resultsPerPage: 100) { respone in
            if let a = respone.data?.companies{
                if a.count == 0 {
                    self.checkData(status: true)
                    self.isFulldata = true
                    self.txtDskh.text = "Danh sách khách hàng ( 0 )"
                } else{
                    if self.totalCount >= respone.data?.count ?? 0 {
                        self.isFulldata = true
                    } else{
                        self.isFulldata = false
                    }
                    self.checkData(status: false)
                   for cus in a{
                    self.custmerList.append(cus)
                    self.tblDsCus.reloadData()
                    self.showLoadingView(loading: false)
                    if let count = respone.data?.count{
                        self.count = count
                        self.txtDskh.text = "Danh sách khách hàng (" + String(describing: count)  + ")"
                    }
                }
                    
                }
                self.totalCount = self.totalCount + 100
            }else {
                self.isFulldata = true
            }
            self.isLoading = false
        } fail: { error in
            self.showArlet(title: "Thông báo", mess: error.getMessage())
            self.checkData(status: true)
            self.isLoading = false
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
        if indexPath.section == 0 {
            let CusVc = CusVc(nibName: "CusVc", bundle: nil)
            CusVc.Customer = custmerList[indexPath.row]
            self.present(CusVc, animated: true)
        }
    }
}
// MARK: - TABLEVIEW DATASORCE
extension DsCusVC: UITableViewDataSource{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        /*    let cellTag = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath)as! CollectionTagViewCell
            cellTag.tagArray = tagArray ?? []*/
             
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
            if custmerList.count == 0, isLoading{
                page = 1
            }
            if count == custmerList.count{
                isFulldata = true
            }
            return custmerList.count
        } else if section == 1 {
            if isFulldata{
                return 0
            }
            return 1
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == custmerList.count - 2, !isLoading,!isFulldata {
	            loadMoreData()
        }
    }
    func loadMoreData(){
        if !self.isLoading {
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
                self.page = self.page+1
                self.initData(page: self.page)
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
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
}


extension DsCusVC:UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

}
 
extension DsCusVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.txtTag.text = tagArray[indexPath.row]
        return cell
    }
    
    
}
extension DsCusVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 30)
    }
}

