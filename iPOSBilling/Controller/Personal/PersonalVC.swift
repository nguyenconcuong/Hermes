//
//  PersonalVC.swift
//  iPOSBilling
//
//  Created by ipos on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalVC: UIViewController {
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtPhongKD: UILabel!
    @IBOutlet weak var txtSaleman: UILabel!
    @IBOutlet weak var txtStatus: UILabel!
    @IBOutlet weak var collectionPersonal: UICollectionView!
    // MARK: -declare
    var user: User?
    var itemGroup: [ItemGroup] = []
    var pinitemsList: [Items] = []
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    let headerIdentifier = "header"
    let footerIdentifier = "footer"
    let searLeadId = "searLeadId"
    let myLeadId = "myLead"
    let myCusId = "myCusID"
    let myCusId1 = "myCusID1"
    let myCusId2 = "myCusID2"
    let myCusId3 = "myCusID3"
    let onboardID = "onboardId"
    let listRqId = "onboardID"
    let listHDId = "listHDId"
    let listtId = "listtId"
    let myCNId = "myCNId"
    let myRoseId = "myRoseId"
    let myVoucher = "myVoucher"
    let videoId = "videoId"
    let documentId = "documentId"
    let nearbyId = "nearbyId"
    let documentId1 = "documentId1"
    let calenderSupportId = "calenderSupportId"
    let listReceiptId = "listReceiptId"
    let listReceiptRepaidId = "listReceiptRepaidId"
    let ortherFindId = "ortherFindId"
    let ortherLeadId = "ortherLeadId"
    let logout = "logout"
    //MARK: -view
    override func viewDidLoad() {
        initDataItems()
        loadpin()
        super.viewDidLoad()
        setview()
        collectionPersonal.delegate = self
        collectionPersonal.dataSource = self
        let nib = UINib(nibName:"PersonalCVC", bundle: nil)
        collectionPersonal.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        let nib1 = UINib(nibName:"PersonalCRV", bundle: nil)
        collectionPersonal.register(nib1, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        let nib2 = UINib(nibName:"PersonalCRVF", bundle: nil)
        collectionPersonal.register(nib2, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        // Do any additional setup after loading the view.
    }
    //MARK: -set View
    func setview(){
        self.title = "Cá Nhân"
        txtPhongKD.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        txtPhongKD.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        txtSaleman.text = user?.role
        txtName.text = user?.name
        txtName.font = UIFont(name: "SFUIDisplay-Semibold", size: 18)
        txtName.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        txtSaleman.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        txtSaleman.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        txtStatus.textColor = UIColor(red: 0.124, green: 0.663, blue: 0.178, alpha: 1)
        txtStatus.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
    }
    //MARK: -Action
    func initDataItems(){
      //  pinitemsList = UserDefaults.standard.object(forKey: "pinitemsList") as! [Items]
        user = AppDelegate.shareDelegate.user
        let items = ["Tra cứu lead", "Lead của tôi", "Khách hàng của tôi", "Khách hàng onboarding", "Ds Phiếu Yêu Cầu", "DS Hoá Đơn", "DS phiếuthu tiền", "Công nợ của tôi", "Hoa Hồng của tôi", "Vouchercủa tôi"]
        let itemsImage = ["ic_other_find", "ic_other_lead", "ic_other_lead", "ic_other_onboarding", "ic_other_list_ro", "ic_other_list_receipt", "ic_other_list_receipt_prepaid", "ic_other_commission", "ic_other_voucher", "ic_other_calendar_personal"]
        let itemsscreen = [searLeadId, myLeadId, myCusId, onboardID, listRqId, listHDId, listtId, myCNId, myRoseId, myVoucher]
        let items1 = ["video kiến thức", "Tài liệu HDSD Sản Phẩm", "Quán IPOS quanh bạn", "Bảng xếp hạng", "Lịch triển khai support", "TT liên hệ NV IPOS", "DS Tính năng phát triển"]
        let itemsImage1 = ["ic_other_video", "icon_other_document", "icon_other_nearby", "icon_other_document", "ic_other_calendar_support", "ic_other_list_receipt", "ic_other_list_receipt_prepaid"]
        let itemsscreen1 = [videoId, documentId, nearbyId, documentId1, calenderSupportId, listReceiptId, listReceiptRepaidId]
        let items2 = ["Qúet QR Code", "Thông tin tài khoản", "Đổi mật khẩu", "gửi feedback", "Cài đặt và hỗ trợ", "Chuyển tài khoản", "Đăng xuất"]
        let itemsImage2 = ["ic_other_find", "ic_other_lead", "ic_other_lead", "ic_other_onboarding", "ic_other_list_ro", "ic_other_list_receipt", "ic_other_list_receipt_prepaid"]
        let itemsscreen2 = [ortherFindId, ortherLeadId, myCusId, myCusId3, myCusId1, myCusId2, logout]
        var itemsList: [Items] = []
        var itemsList1: [Items] = []
        var itemsList2: [Items] = []
        for i in 0..<items.count {
            itemsList.append(Items(imtems: items[i], imageitems: itemsImage[i],itemScreen: itemsscreen[i]))
        }
        for i in 0..<items1.count {
            itemsList1.append(Items(imtems: items1[i], imageitems: itemsImage1[i],itemScreen: itemsscreen1[i]))
        }
        for i in 0..<items1.count {
            itemsList2.append(Items(imtems: items2[i], imageitems: itemsImage2[i],itemScreen: itemsscreen2[i]))
        }
        
        itemGroup.append(ItemGroup(itemsList: itemsList, title: "Bán Hàng"))
        itemGroup.append(ItemGroup(itemsList: itemsList1, title: "Thư viện"))
        itemGroup.append(ItemGroup(itemsList: itemsList2, title: "Tài khoản"))
    }
    func loadpin() {
        let pinData = UserDefaults.standard.stringArray(forKey: "pinData")
        if let pinData = pinData{
            for i in 0..<itemGroup.count{
                let itemList1 = itemGroup[i].itemsList
                for j in 0..<itemList1.count{
                    if (pinData.contains(itemList1[j].itemScreen)){
                        pinitemsList.append(itemList1[j])
                    }
                }
            }
        }
    }
    func presentVC(index: String){
        switch index {
        case myCusId:
            let cusVc = DsCusVC(nibName: "DsCusVC", bundle: nil)
            self.present(cusVc, animated: true)
        case logout:
            AppDelegate.shareDelegate.user = nil
            UserDefaults.standard.removeObject(forKey: "userToken")
            let main = LoginnVc(nibName: "LoginnVc", bundle: nil)
            AppDelegate.shareDelegate.window?.rootViewController = main
        default:
            break
        }
    }
    func showAlert(title: String, message: String, item: Items, check: Bool)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addActions(actions: [
            UIAlertAction(title: "Có", style: .default, handler: {_ in
                if(!check){
                    let index = self.pinitemsList.firstIndex{ $0.imtems == item.imtems}
                    if index == nil {
                        self.pinitemsList.append(item)
                     
                    }
                } else{
                    let index = self.pinitemsList.firstIndex{ $0.imtems == item.imtems}
                    if let index = index {
                        self.pinitemsList.remove(at: index)
                    }
                }
                var pinData = [String]()
                for i in 0..<self.pinitemsList.count{
                    pinData.append(self.pinitemsList[i].itemScreen)
                }
                UserDefaults.standard.set(pinData, forKey: "pinData")
                print(pinData)
                pinData.removeAll()
                self.collectionPersonal.reloadData()
            }),
            UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        ], preferred: "Cancel")
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
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
// MARK: - UICollectionViewDataSource protocol

// tell the collection view how many cells to make

extension PersonalVC:UICollectionViewDataSource{

    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section == 0 && pinitemsList.isEmpty){
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: 50, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section != 0){
            return itemGroup[section-1].itemsList.count
        } else if (!pinitemsList.isEmpty){
            return pinitemsList.count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemGroup.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if(kind == UICollectionView.elementKindSectionFooter){
            let footerheaderview = collectionView.dequeueReusableSupplementaryView(ofKind:  UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentifier, for: indexPath) as! PersonalCRVF
            if(indexPath.section == 0){
                footerheaderview.txtHold.isHidden = false
                } else{
                footerheaderview.txtHold.isHidden = true
            }
            return footerheaderview
        }
        let sectionheaderview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! PersonalCRV
        if(indexPath.section == 0 ){
            if(pinitemsList.isEmpty){
                sectionheaderview.isHidden = true
            } else{
                sectionheaderview.isHidden = false
            }
            sectionheaderview.titleLable.text = "Đã Ghim"
        }else {
            sectionheaderview.titleLable.text = itemGroup[indexPath.section-1].title
        }
            return sectionheaderview
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PersonalCVC
        // Use the outlet in our custom class to get a reference to the UILabel in the cells
        cell.didTapItem = { item in
            self.presentVC(index: item.itemScreen)
        }
        if(indexPath.section == 0 ){
            let itemsList = pinitemsList
            let data = itemsList[indexPath.row]
            cell.item = data
            cell.didSelectItem = { item in
                self.showAlert(title: "Thông báo", message: "Bạn có muốn xoá ghim không?",item: item,check: true)
            }
            return cell
        }else{
            let itemsList: [Items] = itemGroup[indexPath.section-1].itemsList
            let data = itemsList[indexPath.row]
            cell.item = data
            cell.didSelectItem = { item in
                self.showAlert(title: "Thông báo", message: "Bạn có muốn ghim không?",item: item,check: false)
            }
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate protocol

extension PersonalVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
    }

}
