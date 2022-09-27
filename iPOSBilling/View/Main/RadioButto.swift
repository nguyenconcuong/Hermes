//
//  RadioButto.swift
//  iPOSBilling
//
//  Created by ipos on 22/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.initButton()
        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.initButton()
        
    }
    
    func initButton() {
        
        self.backgroundColor = .clear
        
        self.tintColor = .clear

        self.setImage(UIImage(named: "ic_radio_normal")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.setImage(UIImage(named: "ic_radio_selected")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        
        self.setImage(UIImage(named: "ic_radio_selected")?.withRenderingMode(.alwaysOriginal), for: .selected)
        
    }
    
}
