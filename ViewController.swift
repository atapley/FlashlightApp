//
//  ViewController.swift
//  Flashlight
//
//  Created by Alex Tapley on 3/2/17.
//  Copyright © 2017 Alex Tapley. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: Properties
    
    // Outlet for the label saying "On" or "Off"
    @IBOutlet weak var onOrOff: UILabel!
    
    // The device that the app is running on
    let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    // Run when the button is pushed
    @IBAction func buttonPushed(_ sender: UIButton) {
        // Set the label to "On" or "Off"
        if (onOrOff.text == "Off") {
            // Set label to "On"
            onOrOff.text = "On"
        }
        else {
            // Set label to "Off"
            onOrOff.text = "Off"
        }
        
        // Turn the flashlight "On" or "Off"
        // If the device has a flashlight...
        if (device?.hasTorch)! {
            
            // Do this...
            do {
                // Locks the device for configurations to happen to the hardware
                try device?.lockForConfiguration()
                if onOrOff.text == "On" {
                    // Turns flashlight on
                    device?.torchMode = .on
                }
                else {
                    // Turns flashlight off
                    device?.torchMode = .off
                }
                // Unlocks the device when done making configurations, so the app has control again
                device?.unlockForConfiguration()
            }
                // If the function cannot do the previous code...
            catch {
                print("Torch could not be used")
            }
        }
            // If the device does not have a flashlight...
        else {
            print("Torch is not available")
        }
    }
}


