//
//  ViewController.swift
//  MixpanelDemo
//
//  Created by Surabhi Chopada on 03/02/17.
//  Copyright © 2017 Surabhi Chopada. All rights reserved.
//

import UIKit
import Mixpanel
class ViewController: UIViewController {
@IBOutlet weak var counterLabel: UILabel!
var counter = 60
var SwiftTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counterLabel.text = String(counter)
    }

 override func viewWillAppear(_ animated: Bool) {
    
        
    }
    
    @IBAction func startClick(_ sender: Any) {
      
       counter = 60
       counterLabel.text = String(counter)
       SwiftTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
         //Track Event
        Mixpanel.mainInstance().track(event: "Timer Started")
        // Increment people's property
       // Mixpanel.mainInstance().people.increment(property: "Timer Start", by: 1)
    }
    
    func countdown() {
        if(counter > 0){
        counter -= 1
        counterLabel.text = String(counter)
        }
        else {
          SwiftTimer.invalidate()
        }
    }
    
    @IBAction func stopClick(_ sender: Any) {
        SwiftTimer.invalidate()
       //Track event with property
        Mixpanel.mainInstance().track(event: "Timer Stopped", properties: ["Counter":counterLabel.text!])
        Mixpanel.mainInstance().people.set(property:"Latest Time Record", to: counterLabel.text!)
        Mixpanel.mainInstance().people.increment(property: "Time Recorded",
                                                 by: 1)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

