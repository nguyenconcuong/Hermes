//
//  PersonalCVC.swift
//  iPOSBilling
//
//  Created by ipos on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalCVC: UICollectionViewCell, UIGestureRecognizerDelegate {
    var item: Items? {
        didSet {
            txtTitle.text = item?.imtems
            if let itemImg = item?.imageitems {
                img.image = UIImage(named: itemImg)
            }
        }
    }
    var didSelectItem:((_ item: Items)->())?
    var didTapItem:((_ item: Items)->())?
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    override func awakeFromNib() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        self.addGestureRecognizer(longPressRecognizer)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tapGestureRecognizer)
        super.awakeFromNib()
        // Initialization code
        txtTitle.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
    }
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        if let item = item {
            didSelectItem?(item)
        }
    }
    @objc func tapped(sender: UITapGestureRecognizer) {
        if let item = item {
            didTapItem?(item)
        }
    }
    
    

}


