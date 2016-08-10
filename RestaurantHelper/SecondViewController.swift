//
//  SecondViewController.swift
//  RestaurantHelper
//
//  Created by iOess on 7/28/16.
//  Copyright © 2016 iOess. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var numberOfPeopleControl: UISegmentedControl!
    @IBOutlet weak var splitAmount: UILabel!
    
    override func viewDidLoad() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(gesture)
    }
    

    @IBAction func updateNumberOfPeople(sender: AnyObject) {
        
        guard let billTotal = Double(billTextField.text!)
            else { return }
        
        let splitTotal = Double(billTotal) / Double(numberOfPeopleControl.selectedSegmentIndex + 2)
        let string = String(format: "$%.2f", splitTotal)
        splitAmount.text = string
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

