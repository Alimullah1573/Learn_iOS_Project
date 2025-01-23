//
//  ViewController.swift
//  input_kebord_on_of
//
//  Created by TwinBit Ltd on 27/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var a = ""
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func Button(_ sender: Any) {
        
        
        a = input.text!
        output.text = "YES: \(a)"
        input.text = ""
        view.endEditing(true)    // aide dia shodo Boutton caple kebord hide hoia jave
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  // ai code dia display ar je kono shate tuch korle kebord hide hoia jay
    }
    
}

