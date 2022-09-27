//
//  PYCListCell.swift
//  iPOSBilling
//
//  Created by ipos on 21/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PYCListCell: UICollectionViewCell,UIGestureRecognizerDelegate {
    var item: PYCItemsModal? {
        didSet {
            textViewPYC.text = item?.item
        }
    }
    var cellView: UIView!
    var didTapItemPYC:((_ item: PYCItemsModal)->())?
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var textViewPYC: UITextView!
    override func awakeFromNib() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        textViewPYC.isEditable = false
        textViewPYC.font = UIFont(name: "SFUDisplay-Regular", size: 18)
        // Initialization code
    }
    @objc func tap(sender: UITapGestureRecognizer) {
        
        if let item = item {
            didTapItemPYC?(item)
        }
    }

}
