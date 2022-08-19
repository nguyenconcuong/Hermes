//
//  PersonalCVC.swift
//  iPOSBilling
//
//  Created by ipos on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalCVC: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtTitle.font = UIFont.systemFont(ofSize: 14)
        
    }

}
