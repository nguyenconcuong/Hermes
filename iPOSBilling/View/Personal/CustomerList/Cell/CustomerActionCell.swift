//
//  CustomerActionCell.swift
//  iPOSBilling
//
//  Created by ipos on 06/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class CustomerActionCell: UITableViewCell {
    @IBOutlet weak var txtAction: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnActon: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtAction.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        txtAction.font = UIFont(name: "SFUIDisplay-Regular", size: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
