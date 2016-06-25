//
//  ViewController.swift
//  Tipping
//
//  Created by Nhung Huynh on 6/25/16.
//  Copyright © 2016 Nhung Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTf: UITextField!
    
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipAmountLb: UILabel!
    
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var sliptAmountLb: UILabel!
    @IBOutlet weak var totalAmoutLb: UILabel!
    var tip:Int = 0
    var minTip:Int = 0
    var maxTip:Int = 100
    
    var split:Int = 0
    var minSplit:Int = 1
    var maxSplit:Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        split = minSplit
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("DEFAULT_TIP") == nil {
            defaults.setInteger(0, forKey: "DEFAULT_TIP")
            defaults.synchronize()
        }
        tip = defaults.integerForKey("DEFAULT_TIP")
        
        tipPercentage.text = "\(tip) %"
        splitNumber.text = "\(minSplit)"
        tipAmountLb.text = "$0.00"
        sliptAmountLb.text = "$0.00"
        totalAmoutLb.text = "$0.000"
        clearBtn.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increaseTipPercentage(sender: AnyObject) {
        tip += 5
        if tip >= maxTip {
            tip = maxTip
        }
        tipPercentage.text = "\(tip) %"
        calculateAmounts(self)
    }
    @IBAction func decreaseTipPercentage(sender: AnyObject) {
        tip -= 5
        if tip <= minTip {
            tip = minTip
        }
        tipPercentage.text = "\(tip) %"
        calculateAmounts(self)
    }
    @IBAction func increaseSlipt(sender: AnyObject) {
        split += 1
        if split >= maxSplit {
            split = maxSplit
        }
        splitNumber.text = "\(split)"
        calculateAmounts(self)
    }
    @IBAction func decreaseSlipt(sender: AnyObject) {
        split -= 1
        if split <= minSplit
        {
            split = minSplit
        }
        splitNumber.text = "\(split)"
        calculateAmounts(self)
    }
    @IBAction func calculateAmounts(sender: AnyObject) {
        let billAmount = Double(billAmountTf.text!)
        let calTip = (billAmount ?? 0) * (Double(tip)/100)
        let calTotal = (billAmount ?? 0) + calTip
        let calSplit = calTotal/Double(split)
        tipAmountLb.text = String(format: "$%.2f", calTip)
        sliptAmountLb.text = String(format: "$%.2f", calSplit)
        totalAmoutLb.text = String(format: "$%.2f", calTotal)
    }
    
    @IBAction func clearInfo(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        tip = defaults.integerForKey("DEFAULT_TIP")
        tipPercentage.text = "\(tip) %"
        splitNumber.text = "\(minSplit)"
        tipAmountLb.text = "$0.00"
        sliptAmountLb.text = "$0.00"
        totalAmoutLb.text = "$0.000"
        billAmountTf.text = ""
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
