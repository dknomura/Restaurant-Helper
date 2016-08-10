//
//  TaxViewController.swift
//  RestaurantHelper
//
//  Created by iOess on 8/4/16.
//  Copyright © 2016 iOess. All rights reserved.
//

import UIKit

class TaxViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var price1: UITextField!
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var price2: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var price3: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var price4: UITextField!
    @IBOutlet weak var number4: UITextField!
    @IBOutlet weak var price5: UITextField!
    @IBOutlet weak var number5: UITextField!
    @IBOutlet weak var price6: UITextField!
    @IBOutlet weak var number6: UITextField!
    @IBOutlet weak var price7: UITextField!
    @IBOutlet weak var number7: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var calculatedTaxLabel: UILabel!
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var beforeTaxLabel: UILabel!
    @IBOutlet weak var afterTaxLabel: UILabel!

    override func viewDidLoad() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(TaxViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    
    @IBAction func updateTax(sender: AnyObject) {
        
        // Arrays of text fields
        let prices = [price1.text!, price2.text!, price3.text!, price4.text!, price5.text!, price6.text!, price7.text!]
        let numbers = [number1.text!, number2.text!, number3.text!, number4.text!, number5.text!, number6.text!, number7.text!]
     
        // Make slider snap to increments of 0.025 (NYC tax is 8.875%)
        let stepValue: Float = 0.025
        let newStep = roundf((taxSlider.value) / stepValue);
        taxSlider.value = newStep * stepValue;
        let taxPercent:Double = Double(taxSlider.value)
        let taxPercentString = String(format: "%.3f", taxPercent)
        taxLabel.text = ("\(taxPercentString)%")
        
        var billTotal:Double = 0.0
        for i in 0..<prices.count {
            guard let price = Double(prices[i]) else {
                print("Could not cast price as double")
                continue
            }
            guard let number = Double(numbers[i]) else {
                print("Could not case number as int")
                continue
            }
            
            billTotal += price * number
        }
        
        let beforeTaxString = String(format: "Before tax: $%.2f", billTotal)
        beforeTaxLabel.text = beforeTaxString
        
        let tax = billTotal * (Double(taxPercent) / 100) + billTotal
        let taxString = String(format: "$%.2f", tax)
        calculatedTaxLabel.text = taxString
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
