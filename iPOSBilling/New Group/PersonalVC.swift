//
//  PersonalVC.swift
//  iPOSBilling
//
//  Created by ipos on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionPersonal: UICollectionView!
    var itemsTile = "Bán hàng, Thư viện, Tài khoản"
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    let headerIdentifier = "header"
       var items = ["tra cứu lead", "lead của tôi", "Khách hàng của tôi", "khách hàng onboarding", "Ds Phiếu Yêu Cầu", "DS Hoá Đơn", "DS phiếuthu tiền", "Công nợ của tôi", "Hoa Hồngcủa tôi", "Vouchercủa tôi"]
       var itemsImage = ["ic_other_find", "ic_other_lead", "ic_other_lead", "ic_other_onboarding", "ic_other_list_ro", "ic_other_list_receipt", "ic_other_list_receipt_prepaid", "ic_other_commission", "ic_other_voucher", "ic_other_calendar_personal"]
    
    var items1 = ["video kiến thức", "Tài liệu HDSD Sản Phẩm", "Quán IPOS quanh bạn", "Bảng xếp hạng", "Lịch triển khai support", "TT liên hệ NV IPOS", "DS Tính năng phát triển"]
    var itemsImage1 = ["ic_other_video", "icon_other_document", "icon_other_nearby", "icon_other_document", "ic_other_calendar_support", "ic_other_list_receipt", "ic_other_list_receipt_prepaid"]
 
   
    var items2 = ["Qúet QR Code", "Thông tin tài khoản", "Đổi mật khẩu", "gửi feedback", "Cài đặt và hỗ trợ", "Chuyển tài khoản", "Đăng xuất"]
    var itemsImage2 = ["ic_other_find", "ic_other_lead", "ic_other_lead", "ic_other_onboarding", "ic_other_list_ro", "ic_other_list_receipt", "ic_other_list_receipt_prepaid"]
 
       // MARK: - UICollectionViewDataSource protocol
       
       // tell the collection view how many cells to make
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return self.items.count
        } else if(section == 1) {
            return self.items1.count
        } else{
            return self.items2.count
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
            cell.txtTitle.text = self.items[indexPath.row] // The row value is the same as the index of the desired text within the array./
            cell.img.image = UIImage(named: self.itemsImage[indexPath.row])
        }
        else if (indexPath.section == 1){
            cell.txtTitle.text = self.items1[indexPath.row] // The row value is the same as the index of the desired text within the array./
            cell.img.image = UIImage(named: self.itemsImage1[indexPath.row])
         
        } else{
            cell.txtTitle.text = self.items2[indexPath.row] // The row value is the same as the index of the desired text within the array./
            cell.img.image = UIImage(named: self.itemsImage2[indexPath.row])
        }
        return cell
       }

       // MARK: - UICollectionViewDelegate protocol
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           // handle tap events
        if(indexPath.section == 0){
            switch indexPath.row {
            case 2:
                let cusVc = DsCusVC(nibName: "DsCusVC", bundle: nil)
                self.navigationController?.pushViewController(cusVc, animated: true);
            case 1:
                break
            default:
                break
            }
            
        }
       }

    override func viewDidLoad() {
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
