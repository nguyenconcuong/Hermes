//
//  hardwareServiceCell.swift
//  iPOSBilling
//
//  Created by ipos on 26/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class hardwareServiceCell: UITableViewCell {

    @IBOutlet weak var imageSerive: UIImageView!
    @IBOutlet weak var labelhardwareName: UILabel!
    
    @IBOutlet weak var textCount: UITextField!
    @IBOutlet weak var labelAmout: UILabel!
    var minChoice:Int = 0
    var maxChoice:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        textCount.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        // Initialization code
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
    
        if let text = textCount.text{
            if text == "0"{
                textCount.text = "0"
            }else{

            if let count = Int(text){
                if count < minChoice,minChoice != maxChoice{
                    textCount.text = String(minChoice)
                }
                if count > maxChoice,minChoice != maxChoice{
                    textCount.text = String(maxChoice)
                }
                if minChoice == maxChoice, minChoice != 0{
                    textCount.text = String(maxChoice)
                }
            }
            }}
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func ActionDetail(_ sender: Any) {
    }
    
    @IBAction func ActionIncrease(_ sender: Any) {
        checkCount(isIncrease: true, textCount: textCount, minChoice: minChoice, maxChoice: maxChoice)
    }
    @IBAction func ActionDecrease(_ sender: Any) {
        checkCount(isIncrease: false, textCount: textCount, minChoice: minChoice, maxChoice: maxChoice)
    }
}
