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
     txtTitle.font = UIFont(name: "SFUDisplay-Regular", size: 10)
        txtTitle.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
     
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
