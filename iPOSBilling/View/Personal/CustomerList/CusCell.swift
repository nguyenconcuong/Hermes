//
//  CusCell.swift
//  iPOSBilling
//
//  Created by ipos on 25/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class CusCell: UITableViewCell {

    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var btnCopy: UIButton!
    @IBOutlet weak var txtContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
