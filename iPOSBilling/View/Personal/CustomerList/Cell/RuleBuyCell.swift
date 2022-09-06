//
//  RuleBuyCell.swift
//  iPOSBilling
//
//  Created by ipos on 05/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class RuleBuyCell: UITableViewCell {

    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtStatus: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
