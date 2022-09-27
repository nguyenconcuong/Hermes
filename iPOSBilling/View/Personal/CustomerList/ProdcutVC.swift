//
//  ProdcutVC.swift
//  iPOSBilling
//
//  Created by ipos on 23/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit
import DropDown
class ProdcutVC: UIViewController {
    @IBOutlet weak var labelProduct: UILabel!
    @IBOutlet weak var vewPickProduct: UIView!
    @IBOutlet weak var viewPickProduct: UIView!
    let dropDown = DropDown()
    var productList: [Product] = []
    var doprownData: [String] = []
    var doprownCode: [String] = []
    var serviceData: [Service] = []
    var serviceList: [ServiceList] = []
    var customer: Customer?
    @IBOutlet weak var btnNext: UIButton!
    var hardwareServiceIdentify = "hardwareServiceCell"
    var otherServiceIdentify = "otherServiceCell"
    var subServiceIdentify = "subServiceCell"
    var ComboServiceIdentify = "ComboServiceCell"
    @IBOutlet weak var tbvService: UITableView!
    var countSession = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        setupView()
        tbvService.delegate = self
        tbvService.dataSource = self
        let hardwareServiceCell = UINib(nibName:"hardwareServiceCell", bundle: nil)
        tbvService.register(hardwareServiceCell, forCellReuseIdentifier: hardwareServiceIdentify)
        let otherServiceCell = UINib(nibName:"otherServiceCell", bundle: nil)
        tbvService.register(otherServiceCell, forCellReuseIdentifier: otherServiceIdentify)
        let subServiceCell = UINib(nibName:"subServiceCell", bundle: nil)
        tbvService.register(subServiceCell, forCellReuseIdentifier: subServiceIdentify)
        let ComboServiceCell = UINib(nibName:"ComboServiceCell", bundle: nil)
        tbvService.register(ComboServiceCell, forCellReuseIdentifier: ComboServiceIdentify)
        // Do any additional setup after loading the view.
        
    }
    func initData(){
        showUniversalLoadingView(show: true, loadingText: "Đang xử lý")
        ApiOperations.getProductBranch() { respone in
            if let product = respone.data{
                for product in product{
                    self.productList.append(product)
                    if let name = product.name {
                        self.doprownData.append(name)
                    }
                }
                self.labelProduct.text = self.productList[0].name
                if let code = self.productList[0].code{
                    self.loadService(productCode: code)
                }
                
            }
            self.showUniversalLoadingView(show: false)
        } fail: { err in
            print(err)
        }
        
    }
    //MARK: SetupView
    func setupView(){
        viewPickProduct.layer.borderWidth = 0.8
        viewPickProduct.layer.borderColor = UIColor.lightGray.cgColor
        viewPickProduct.layer.cornerRadius = 5
        btnNext.layer.cornerRadius = 5
    }
    @IBAction func ActionProduct(_ sender: Any) {
        action(dropDown: dropDown, value: doprownData)
        dropDown.anchorView = viewPickProduct
        dropDown.show()
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
   
        labelProduct.text = dropDown.selectedItem
        if let index = dropDown.indexForSelectedRow {
            loadService(productCode: productList[index].code ?? "")
        }
        
        
    }
    func loadService(productCode: String){
        serviceList.removeAll()
        showUniversalLoadingView(show: true, loadingText: "Đang xử lý")
        ApiOperations.getProductService(productCode: productCode){ respone in
            var hardwareService: [Service] = []
            var subService: [Service] = []
            var otherService: [Service] = []
            var comboService: [Service] = []
            if let service = respone.data{
                for service in service{
                    self.serviceData.append(service)
                    switch service.type {
                    case "hardware":
                        hardwareService.append(service)
                    case "sub":
                        subService.append(service)
                    case "combo":
                        comboService.append(service)
                    default:
                        otherService.append(service)
                    }
                }
            }
            if comboService.count != 0 {
                self.serviceList.append(ServiceList(title: "Combo", Service: comboService))
                
            }
            if hardwareService.count != 0 {
                self.serviceList.append(ServiceList(title: "Phần Cứng", Service: hardwareService))
                
            }
            if otherService.count != 0 {
                self.serviceList.append(ServiceList(title: "Khác", Service: otherService))
                
            }
            if subService.count != 0 {
                self.serviceList.append(ServiceList(title: "Thuê bao", Service: subService))
                
            }
            self.tbvService.reloadData()
            self.showUniversalLoadingView(show: false)
        } fail: { err in
            self.showArlet(title: "Thông Báo", mess: err.getMessage())
            self.showUniversalLoadingView(show: false)
        }
        
        
        
        
    }
    //MARK: Action
    
    @IBAction func ActionNext(_ sender: Any) {
        let infoDeploy = InfoDeployVC(nibName: "InfoDeployVC", bundle: nil)
        infoDeploy.customer = customer
        navigationController?.pushViewController(infoDeploy, animated: true)
    }
    @IBAction func btnSearch(_ sender: Any) {
        
    }
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
extension ProdcutVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch serviceList[indexPath.section].title {
        case "Combo":
            return 80
        case "Phần Cứng":
            return 80
        case "sub":
            return 100
        default:
            return 80
        }
    }
}
extension ProdcutVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.serviceList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList[section].Service?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let serviceData = serviceList[indexPath.section].Service{
            switch serviceList[indexPath.section].title {
            case "Combo":
                let cell = tableView.dequeueReusableCell(withIdentifier: ComboServiceIdentify, for: indexPath)as! ComboServiceCell
                cell.minChoice = serviceData[indexPath.row].minChoice ?? 0
                cell.maxChoice = serviceData[indexPath.row].maxChoice ?? 0
                cell.labelName.text = serviceData[indexPath.row].name
                cell.labelInfo.text = serviceData[indexPath.row].desc
                if let unitPrice = serviceData[indexPath.row].unitPrice{
                    if let unitName = serviceData[indexPath.row].unitName{
                        cell.labelAmount.text = "\(unitPrice) đ/\(unitName)"
                        
                    }
                }
                return cell
            case "Phần Cứng":
                let cell = tableView.dequeueReusableCell(withIdentifier: hardwareServiceIdentify, for: indexPath)as! hardwareServiceCell
                cell.minChoice = serviceData[indexPath.row].minChoice ?? 0
                cell.maxChoice = serviceData[indexPath.row].maxChoice ?? 0
                cell.labelhardwareName.text = serviceData[indexPath.row].name
                cell.imageSerive?.loadFrom(URLAddress: serviceData[indexPath.row].image ?? "" )
                if let unitPrice = serviceData[indexPath.row].unitPrice{
                    if let unitName = serviceData[indexPath.row].unitName{
                        cell.labelAmout.text = "\(unitPrice) đ/\(unitName)"
                    }
                }
                return cell
            case "Thuê bao":
                let cell = tableView.dequeueReusableCell(withIdentifier: subServiceIdentify, for: indexPath)as! subServiceCell
                cell.minChoice = serviceData[indexPath.row].minChoice ?? 0
                cell.maxChoice = serviceData[indexPath.row].maxChoice ?? 0
                cell.labelName.text = serviceData[indexPath.row].name
                cell.labelInfo.text = serviceData[indexPath.row].desc
                if let unitPrice = serviceData[indexPath.row].unitPrice{
                    if let unitName = serviceData[indexPath.row].unitName{
                        cell.labelAmout.text = "\(unitPrice) đ/\(unitName)"
                    }
                }
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: otherServiceIdentify, for: indexPath)as! otherServiceCell
                cell.minChoice = serviceData[indexPath.row].minChoice ?? 0
                cell.maxChoice = serviceData[indexPath.row].maxChoice ?? 0
                cell.labelName.text = serviceData[indexPath.row].name
                if let unitPrice = serviceData[indexPath.row].unitPrice{
                    if let unitName = serviceData[indexPath.row].unitName{
                        cell.labelAmout.text = "\(unitPrice) đ/\(unitName)"
                    }
                }
                return cell
            }
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: subServiceIdentify, for: indexPath)as! subServiceCell
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        let label = UILabel()
        label.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        label.font =  UIFont(name: "SFUIDisplay-Semibold", size: 15)
        label.frame = CGRect.init(x: 10, y: 15, width: headerView.frame.width, height: 20)
        label.text = serviceList[section].title
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        headerView.addSubview(label)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        } 
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
