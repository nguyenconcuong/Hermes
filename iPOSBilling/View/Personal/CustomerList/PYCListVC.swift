//
//  PYCListVC.swift
//  iPOSBilling
//
//  Created by ipos on 21/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PYCListVC: UIViewController {
    let headerIdentifier = "header"
    var pycItemsList: [PYCItemsListModal] = []
    var pycItems: [PYCItemsModal] = []
    var customer: Customer?
    let saleOpenPoint = "sale tu mo diem"
    @IBOutlet weak var PYCListCollectionVC: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupview()
        initData()
        title = "Tạo PYC"
        let cellNib = UINib(nibName: "PYCListCell", bundle: nil)
        PYCListCollectionVC.register(cellNib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "HeaderPYCList", bundle: nil)
        PYCListCollectionVC.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        PYCListCollectionVC.delegate = self
        PYCListCollectionVC.dataSource = self
        // Do any additional setup after loading the view.
    }

    func setupview(){
     
    }
    func initData(){
        pycItems = []
        pycItems.append(PYCItemsModal(item: "Saleman tự triển khai điểm mới",itemScreen: saleOpenPoint))
        pycItems.append(PYCItemsModal(item: "Saleman gia hạn bản quyền/mua thêm thiết bị", itemScreen: ""))
        pycItemsList.append(PYCItemsListModal(title: "PYC SALEMAN TỰ XỬ LÝ", item:pycItems ))
        
        pycItems = []
        pycItems.append(PYCItemsModal(item: "Kĩ thuật triển khai điểm mới", itemScreen: ""))
        pycItems.append(PYCItemsModal(item: "Mua thêm thiết bị, phần mềm", itemScreen: ""))
        pycItems.append(PYCItemsModal(item: "Sale tạo PYC hỗ trợ cho KH còn bảo hành", itemScreen: ""))
        pycItems.append(PYCItemsModal(item: "PYC bảo trì, gia hạn điểm", itemScreen: ""))
        pycItemsList.append(PYCItemsListModal(title: "PYC HỖ TRỢ / TRIỂN KHAI BỞI KỸ THUẬT", item: pycItems))
        pycItems = []
        
        pycItems.append(PYCItemsModal(item: "Hiệu chỉnh phiếu yêu cầu", itemScreen: ""))
        pycItems.append(PYCItemsModal(item: "Hiệu chỉnh hoá đơn", itemScreen: ""))
        pycItemsList.append(PYCItemsListModal(title: "PYC HIỆU CHỈNH", item: pycItems))
        pycItems = []
        
        pycItems.append(PYCItemsModal(item: "Hợp đồng Mẫu / khung / Dự án / cho khách", itemScreen: ""))
        pycItems.append(PYCItemsModal(item: "Dịch vụ mở rộng", itemScreen: ""))
        pycItemsList.append(PYCItemsListModal(title: "PYC KHÁC", item: pycItems))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func presentVC(index: String){
        switch index {
        case saleOpenPoint:
            let inputDataVC = InputDataVC(nibName: "InputDataVC", bundle: nil)
            inputDataVC.customer = customer
            navigationController?.pushViewController(inputDataVC, animated: true)

        default:
            break
        }
    }
}
extension PYCListVC:UICollectionViewDelegate{

}
extension PYCListVC:UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pycItemsList[section].item.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pycItemsList.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PYCListCollectionVC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! PYCListCell
        cell.item = pycItemsList[indexPath.section].item[indexPath.row]
        cell.didTapItemPYC = { item in
            self.presentVC(index: item.itemScreen)
        }
        cell.textViewPYC.text = pycItemsList[indexPath.section].item[indexPath.row].item
       return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionheaderview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! HeaderPYCList
           sectionheaderview.txtHeader.text = pycItemsList[indexPath.section].title
        sectionheaderview.txtHeader.font = UIFont(name: "SFUIDisplay-Semibold", size: 16)
        sectionheaderview.txtHeader.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
            return sectionheaderview
    }
    
    
}
