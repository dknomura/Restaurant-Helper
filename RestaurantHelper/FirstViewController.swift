//
//  FirstViewController.swift
//  RestaurantHelper
//
//  Created by iOess on 7/28/16.
//  Copyright © 2016 iOess. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var newTotal: UILabel!
    
    override func viewDidLoad() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(gesture)

    }

    @IBAction func updateTip(sender: AnyObject) {
        
        let tipPercent:Int = Int(tipSlider.value)
        tipLabel.text = "\(tipPercent)%"
        
        guard let billTotal = Double(billTotalTextField.text!)
            else { return }
        
        let tipTotal = billTotal * (Double(tipPercent) / 100)
        let string = String(format:"$%.2f", tipTotal)
        tipAmount.text = string
        
        let newTotalString = String(format:"New total: $%.2f", tipTotal + billTotal)
        newTotal.text = newTotalString
    }

    @IBAction func dismissKeyboard(sender: UIGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}

