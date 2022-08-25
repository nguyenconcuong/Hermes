//
//  ViewController.swift
//  iPOSBilling
//
//  Created by quan nguyen on 2/3/20.
//  Copyright © 2020 quan nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}

extension UIViewController{
    func showArlet(title: String, mess: String){
        let alert = UIAlertController(title: title, message: mess, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
       self.present(alert, animated: true, completion: nil)
    }
}
