//
//  PersonalVC.swift
//  iPOSBilling
//
//  Created by ipos on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalVC: UIViewController {
    @IBOutlet weak var collectionPersonal: UICollectionView!
    // MARK: -declare
    var itemsTile = "Bán hàng, Thư viện, Tài khoản"
    var itemsList1: [Items] = []
    var itemsList2: [Items] = []
    var itemsList3: [Items] = []
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    let headerIdentifier = "header"
    //MARK: -view
    override func viewDidLoad() {
        initDataItems()
        super.viewDidLoad()
        self.title = "Cá Nhân"
        collectionPersonal.delegate = self
        collectionPersonal.dataSource = self
        let nib = UINib(nibName:"PersonalCVC", bundle: nil)
        collectionPersonal.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        let nib1 = UINib(nibName:"PersonalCRV", bundle: nil)
        collectionPersonal.register(nib1, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // Do any additional setup after loading the view.
    }
    //MARK: -Action
    func initDataItems(){
        let items = ["tra cứu lead", "lead của tôi", "Khách hàng của tôi", "khách hàng onboarding", "Ds Phiếu Yêu Cầu", "DS Hoá Đơn", "DS phiếuthu tiền", "Công nợ của tôi", "Hoa Hồngcủa tôi", "Vouchercủa tôi"]
        let itemsImage = ["ic_other_find", "ic_other_lead", "ic_other_lead", "ic_other_onboarding", "ic_other_list_ro", "ic_other_list_receipt", "ic_other_list_receipt_prepaid", "ic_other_commission", "ic_other_voucher", "ic_other_calendar_personal"]
        let items1 = ["video kiến thức", "Tài liệu HDSD Sản Phẩm", "Quán IPOS quanh bạn", "Bảng xếp hạng", "Lịch triển khai support", "TT liên hệ NV IPOS", "DS Tính năng phát triển"]
        let itemsImage1 = ["ic_other_video", "icon_other_document", "icon_other_nearby", "icon_other_document", "ic_other_calendar_support", "ic_other_list_receipt", "ic_other_list_receipt_prepaid"]
        let items2 = ["Qúet QR Code", "Thông tin tài khoản", "Đổi mật khẩu", "gửi feedback", "Cài đặt và hỗ trợ", "Chuyển tài khoản", "Đăng xuất"]
        let itemsImage2 = ["ic_other_find", "ic_other_lead", "ic_other_lead", "ic_other_onboarding", "ic_other_list_ro", "ic_other_list_receipt", "ic_other_list_receipt_prepaid"]
        for i in 0..<items.count {
            itemsList1.append(Items(imtems: items[i], imageitems: itemsImage[i]))
        }
        for i in 0..<items1.count {
            itemsList2.append(Items(imtems: items1[i], imageitems: itemsImage1[i]))
        }
        for i in 0..<items2.count {
            itemsList3.append(Items(imtems: items2[i], imageitems: itemsImage2[i]))
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return self.itemsList1.count
        } else if(section == 1) {
            return self.itemsList2.count
        } else{
            return self.itemsList3.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionheaderview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! PersonalCRV
        switch indexPath.section {
        case 0:
            sectionheaderview.titleLable.text = "bán hàng"
        case 1:
            sectionheaderview.titleLable.text = "Thư Viện"
        case 2:
            sectionheaderview.titleLable.text = "Tài khoản"
        default:
            break;
        }
        
        return sectionheaderview
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PersonalCVC
        if (indexPath.section == 0){
            // Use the outlet in our custom class to get a reference to the UILabel in the cells
            let data = itemsList1[indexPath.row]
            cell.txtTitle.text = data.imtems // The row value is the same as the index of the desired text within the array./
            cell.img.image = UIImage(named: data.imageitems)
        }
        else if (indexPath.section == 1){
            let data = itemsList2[indexPath.row]
            cell.txtTitle.text = data.imtems // The row value is the same as the index of the desired text within the array./
            cell.img.image = UIImage(named: data.imageitems)
            
        } else{
            let data = itemsList3[indexPath.row]
            cell.txtTitle.text = data.imtems // The row value is the same as the index of the desired text within the array./
            cell.img.image = UIImage(named: data.imageitems)
        }
        return cell
    }
    
}
// MARK: - UICollectionViewDelegate protocol

extension PersonalVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        if(indexPath.section == 0){
            switch indexPath.row {
            case 2:
                let cusVc = DsCusVC(nibName: "DsCusVC", bundle: nil)
                self.present(cusVc, animated: true)
            case 1:
                break
            default:
                break
            }
        }
    }
}
