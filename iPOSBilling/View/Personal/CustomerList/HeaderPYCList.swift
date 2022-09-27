//
//  HeaderPYCList.swift
//  iPOSBilling
//
//  Created by ipos on 21/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class HeaderPYCList: UICollectionReusableView {

    @IBOutlet weak var txtHeader: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        txtHeader.font = UIFont(name: "SFUDisplay-Regular", size: 17)
        // Initialization code
    }
    
}
