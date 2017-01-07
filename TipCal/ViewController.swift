//
//  ViewController.swift
//  TipCal
//
//  Created by Jose Guerrero on 1/1/17.
//  Copyright © 2017 Jose Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    let defaults = UserDefaults.standard
    
       override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentage.selectedSegmentIndex = defaults.integer(forKey: "defTip")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        tipPercentage.selectedSegmentIndex = defaults.integer(forKey: "defTip")
        calculateTip(1 as AnyObject)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        let percentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * percentages[tipPercentage.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func verifyItems(origItems: [String], origPrices: [Float], items: [String], prices: [Float]) -> Int {
        var numOfErrors = 0
        for each in items {
            var indexOfOrig = origItems.index(of: each)
            var indexOfAlex = items.index(of: each)
            if origPrices[indexOfOrig!] != prices[indexOfAlex!]{
                numOfErrors += 1
                }
            }
        return numOfErrors
    }
    
    
}

