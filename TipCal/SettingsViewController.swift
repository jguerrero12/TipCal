//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Jose Guerrero on 1/6/17.
//  Copyright © 2017 Jose Guerrero. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipSegment.selectedSegmentIndex = defaults.integer(forKey: "defTip")
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func defTipIsChanged(_ sender: Any) {
        defaults.set(defaultTipSegment.selectedSegmentIndex, forKey: "defTip")
        defaults.synchronize()
    }
    
}
