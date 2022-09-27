//
//  checkbox.swift
//  iPOSBilling
//
//  Created by ipos on 22/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import Foundation
import UIKit
class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "ic_checkbox_selected")! as UIImage
    let uncheckedImage = UIImage(named: "ic_checkbox_normal")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
