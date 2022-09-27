//
//  otherServiceCell.swift
//  iPOSBilling
//
//  Created by ipos on 26/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class otherServiceCell: UITableViewCell {

    @IBOutlet weak var viewSteper: UIView!
    @IBOutlet weak var labelAmout: UILabel!
    @IBOutlet weak var textCount: UITextField!
    @IBOutlet weak var labelName: UILabel!
    var minChoice = 0
    var maxChoice = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSteper.layer.borderWidth=0.5
        viewSteper.layer.borderColor = UIColor.lightGray.cgColor
        viewSteper.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        textCount.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        // Configure the view for the selected state
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textCount.text{
            if Int(text) ?? 0 < minChoice{
                textCount.text = String(minChoice)
            }
        }
        if let text = textCount.text{
        if Int(text) ?? 0 > maxChoice{
            textCount.text = String(maxChoice)
        }
    }
    }
    @IBAction func ActionDetail(_ sender: Any) {
    }
    @IBAction func ActionDecrease(_ sender: Any) {
        checkCount(isIncrease: false, textCount: textCount, minChoice: minChoice, maxChoice: maxChoice)
    }
    @IBAction func ActionIncrease(_ sender: Any) {
        checkCount(isIncrease: true, textCount: textCount, minChoice: minChoice, maxChoice: maxChoice)
    }
}
