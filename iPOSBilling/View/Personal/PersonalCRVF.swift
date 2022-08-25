//
//  PersonalCRVF.swift
//  iPOSBilling
//
//  Created by ipos on 23/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class PersonalCRVF: UICollectionReusableView {
    
    @IBOutlet weak var txtHold: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        txtHold.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        // Initialization code
    }
    
}
