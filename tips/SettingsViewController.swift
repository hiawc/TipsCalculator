//
//  SettingsViewController.swift
//  tips
//
//  Created by Nhat Truong on 2/16/16.
//  Copyright © 2016 Nhat Truong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var minPeople: UITextField!
    @IBOutlet weak var maxPeople: UITextField!
    @IBOutlet weak var segmentDefault: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let max = NSUserDefaults.standardUserDefaults()
        maxPeople.text = String( format: "%i",max.integerForKey("max"))
        let min = NSUserDefaults.standardUserDefaults()
        minPeople.text = String( format: "%i",max.integerForKey("min"))
        let tipDefault = NSUserDefaults()
        let Per = tipDefault.integerForKey("tipDefault")
        segmentDefault.selectedSegmentIndex = Per

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @IBAction func setPeople(sender: AnyObject) {
        let max = NSUserDefaults.standardUserDefaults()
        max.setInteger(NSString(string:maxPeople.text!).integerValue, forKey: "max")
        max.synchronize()
        let min = NSUserDefaults.standardUserDefaults()
        min.setInteger(NSString(string:minPeople.text!).integerValue, forKey: "min")
        min.synchronize()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let tipDefault = NSUserDefaults.standardUserDefaults()
        tipDefault.setInteger(segmentDefault.selectedSegmentIndex, forKey: "tipDefault")
        tipDefault.synchronize()
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
