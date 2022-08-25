//
//  LoginVC.swift
//  iPOSBilling
//
//  Created by ipos on 24/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var txtEmail: UITextField?
    @IBOutlet weak var txtpassword: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnLogin(_ sender: Any) {
    print(txtEmail)
    }
    func initData(){
  
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
