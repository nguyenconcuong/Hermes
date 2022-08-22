//
//  DsCusTVc.swift
//  iPOSBilling
//
//  Created by ipos on 19/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class DsCusTVc: UITableViewCell {
    @IBOutlet weak var txtId: UILabel!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtCode: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtStatus: UILabel!
    @IBOutlet weak var txtLead: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
