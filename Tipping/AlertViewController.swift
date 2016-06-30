//
//  AlertViewController.swift
//  Tipping
//
//  Created by Nhung Huynh on 6/28/16.
//  Copyright © 2016 Nhung Huynh. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
public extension UIAlertController {
    func showAlert(message:String, fromController: UIViewController) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        fromController.presentViewController(alert, animated: true, completion: nil)
    }
}