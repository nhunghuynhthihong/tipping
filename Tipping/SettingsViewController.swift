//
//  SettingsViewController.swift
//  Tipping
//
//  Created by Nhung Huynh on 6/25/16.
//  Copyright © 2016 Nhung Huynh. All rights reserved.
//
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipTf: UITextField!
    
    let alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipTf.text! =  "\(defaults.integerForKey("DEFAULT_TIP"))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let defaultValue = Int(defaultTipTf.text!) else {
            alert.showAlert("Default tip value has to be an Integer!", fromController: self)
            return
        }
        if defaultValue < 0 {
            alert.showAlert("Default tip has to be greater or equal 0!", fromController: self)
            return
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultValue, forKey: "DEFAULT_TIP")
        defaults.synchronize()
    }

}