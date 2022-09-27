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
    func showUniversalLoadingView( show: Bool, loadingText : String = "") {
        let existingView = UIApplication.shared.windows[0].viewWithTag(1200)
        if show {
            if existingView != nil {
                return
            }
            let loadingView = self.makeLoadingView(withFrame: UIScreen.main.bounds, loadingText: loadingText)
            loadingView?.tag = 1200
            UIApplication.shared.windows[0].addSubview(loadingView!)
        } else {
            existingView?.removeFromSuperview()
        }

    }
    func makeLoadingView(withFrame frame: CGRect, loadingText text: String?) -> UIView? {
       let loadingView = UIView(frame: frame)
       loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
       let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
       //activityIndicator.backgroundColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
       activityIndicator.layer.cornerRadius = 6
       activityIndicator.center = loadingView.center
       activityIndicator.hidesWhenStopped = true
       activityIndicator.style = .white
       activityIndicator.startAnimating()
       activityIndicator.tag = 100 // 100 for example

       loadingView.addSubview(activityIndicator)
       if !text!.isEmpty {
           let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
           let cpoint = CGPoint(x: activityIndicator.frame.origin.x + activityIndicator.frame.size.width / 2, y: activityIndicator.frame.origin.y + 80)
           lbl.center = cpoint
           lbl.textColor = UIColor.white
           lbl.textAlignment = .center
           lbl.text = text
           lbl.tag = 1234
           loadingView.addSubview(lbl)
         }
         return loadingView
     }
}
