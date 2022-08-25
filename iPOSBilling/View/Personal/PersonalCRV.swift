//
//  PersonalCRV.swift
//  iPOSBilling
//
//  Created by ipos on 19/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalCRV: UICollectionReusableView {
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLable.font = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        // Initialization code
    }
    
}

