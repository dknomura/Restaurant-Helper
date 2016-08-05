//
//  FirstViewController.swift
//  RestaurantHelper
//
//  Created by iOess on 7/28/16.
//  Copyright © 2016 iOess. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!

    @IBAction func updateTip(sender: AnyObject) {
        
        let tipPercent: Int = Int(tipSlider.value)
        tipLabel.text = "\(tipPercent)%"
        
        guard let billTotal = Double(billTotalTextField.text!)
            else { return }
        
        let tipTotal = billTotal * (Double(tipPercent) / 100)
        let string = String(format:"$%.2f", tipTotal)
        tipAmount.text = string
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
}

