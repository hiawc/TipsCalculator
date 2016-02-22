//
//  ViewController.swift
//  tips
//
//  Created by Nhat Truong on 2/11/16.
//  Copyright © 2016 Nhat Truong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleSlider: UISlider!
    @IBOutlet weak var PeopleLabel: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let tipDefault = NSUserDefaults()
        segment.selectedSegmentIndex = tipDefault.integerForKey("tipDefault")
        let bill = NSUserDefaults.standardUserDefaults()
        billField.text = bill.objectForKey("bill") as? String
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        let bill = NSUserDefaults.standardUserDefaults()
        billField.text = bill.objectForKey("bill") as? String
        let tipDefault = NSUserDefaults()
        segment.selectedSegmentIndex = tipDefault.integerForKey("tipDefault")
        billChanged(1)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let bill = NSUserDefaults.standardUserDefaults()
        bill.setObject(billField.text, forKey: "bill")
        bill.synchronize()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   
    @IBAction func billChanged(sender: AnyObject) {
        let max = NSUserDefaults.standardUserDefaults()
        let maxPeopleValue = max.integerForKey("max")
        peopleSlider.maximumValue = float_t(maxPeopleValue)
        let min = NSUserDefaults.standardUserDefaults()
        let minPeopleValue = min.integerForKey("min")
        peopleSlider.minimumValue = float_t(minPeopleValue)
        let tipPer = [0.1 , 0.15 , 0.20]
        let Per = tipPer[segment.selectedSegmentIndex]
        let billAmount =  NSString(string: billField.text!).doubleValue
        let people = Int(peopleSlider.value)
        if (people == 1){
            PeopleLabel.text = String(format:"%i person", people)
        }
        else{
            PeopleLabel.text = String(format:"%i people", people)
        }
        let tip = billAmount * Per / double_t(people)
        let total = billAmount * (1 + Per)
        tipLabel.text = String(format: "$%.2f per person", tip)
        totalLabel.text = String(format: "$%.2f", total)
        

    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

