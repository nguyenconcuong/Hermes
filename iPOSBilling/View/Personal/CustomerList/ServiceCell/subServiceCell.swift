//
//  subServiceCell.swift
//  iPOSBilling
//
//  Created by ipos on 26/09/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class subServiceCell: UITableViewCell {

    @IBOutlet weak var textCount: UITextField!
    @IBOutlet weak var labelAmout: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelName: UILabel!
    var minChoice:Int = 0
    var maxChoice:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        textCount.text = String(minChoice)
        textCount.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textCount.text{
            if let count = Int(text){
                if count <= minChoice || count >= maxChoice{
                    textCount.text = "0"
                }
            }
        }
    }
 
    @IBAction func ActionIncrease(_ sender: Any) {
        checkCount(isIncrease: true, textCount: textCount, minChoice: minChoice, maxChoice: maxChoice)
    }
    @IBAction func ActionDecrease(_ sender: Any) {
        checkCount(isIncrease: false, textCount: textCount, minChoice: minChoice, maxChoice: maxChoice)
    
    }
}
extension UITableViewCell{
    func checkCount(isIncrease: Bool,textCount: UITextField,minChoice: Int, maxChoice:Int){
        if let text = textCount.text{
            if let count = Int(text) {
            if minChoice == 0, maxChoice == 0 {
                if isIncrease{
                    textCount.text = String(count + 1)
                } else{
                    if count > 0 {
                        textCount.text = String(count - 1)
                    }
                }
            } else if minChoice == maxChoice{
                if isIncrease{
                    textCount.text = String(maxChoice)
                } else{
                    textCount.text = "0"
                }
            } else{
                if count == 0, minChoice > 1 {
                    if isIncrease{
                        textCount.text = String(minChoice)
                    } else{
                    }
                } else if count > minChoice, count <= maxChoice{
                        if isIncrease , count<maxChoice{
                            textCount.text = String(count + 1)
                        }
                         if !isIncrease{
                            if count > 0 {
                                textCount.text = String(count - 1)
                            }
                        }
                } else if count == minChoice{
                    if !isIncrease{
                       if count > 0 {
                           textCount.text = "0"
                       }
                    } else{
                        textCount.text = String(count + 1)
                    }
                }
                }
                
            }
    }
    }


}
