//
//  CollectionTagViewCell.swift
//  iPOSBilling
//
//  Created by ipos on 16/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class CollectionTagViewCell: UITableViewCell {
    var tagArray: [String] = []
    @IBOutlet weak var ColletionTag: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for th    e selected state
    }

    
}
