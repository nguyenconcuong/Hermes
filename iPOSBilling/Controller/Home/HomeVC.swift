//
//  HomeVC.swift
//  iPOSBilling
//
//  Created by ipos on 18/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIAlertController {
  func addActions(actions: [UIAlertAction], preferred: String? = nil) {

    for action in actions {
      self.addAction(action)
        if let preferred = preferred, preferred == action.title {
        self.preferredAction = action
      }
    }
  }
}

