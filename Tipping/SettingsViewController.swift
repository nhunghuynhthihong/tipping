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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultTipTf.text! =  "\(defaults.integerForKey("DEFAULT_TIP"))"
    }
    
    func showAlert (message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let defaultValue = Int(defaultTipTf.text!) else {
            showAlert("Default tip value has to be an Integer!")
            return
        }
        if defaultValue < 0 {
            self.showAlert("Default tip has to be greater or equal 0!")
            return
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultValue, forKey: "DEFAULT_TIP")
        defaults.synchronize()
    }

}