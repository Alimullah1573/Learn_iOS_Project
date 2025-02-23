//
//  ViewController.swift
//  Switch_Button
//
//  Created by TwinBit Ltd on 30/12/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var Display: UILabel!
    
    @IBOutlet weak var Action: UISwitch!
    
    
    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        
        if Action.isOn == true {
            Display.text = "ON"
            view.backgroundColor = UIColor.green
        } else {
            Display.text = "OF"
            view.backgroundColor = UIColor.white
        }
    }
    
}



