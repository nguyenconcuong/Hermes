//
//  TagCell.swift
//  iPOSBilling
//
//  Created by ipos on 14/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {

    @IBOutlet weak var txtTag: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
      self.layer.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        // Initialization codes
    }
    

}
