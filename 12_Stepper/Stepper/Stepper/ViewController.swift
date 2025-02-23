//
//  ViewController.swift
//  Stepper
//
//  Created by TwinBit Ltd on 6/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var output: UILabel!

    @IBAction func StepperAction(_ sender: UIStepper) {
        
        output.text = String(sender.value)
    }
    

}

