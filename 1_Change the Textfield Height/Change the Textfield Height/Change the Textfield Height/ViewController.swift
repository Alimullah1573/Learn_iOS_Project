//
//  ViewController.swift
//  Change the Textfield Height
//
//  Created by TwinBit Ltd on 27/12/24.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var second_Nunber: UITextField!
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var Firs_number: UITextField!
    
    @IBAction func view_result(_ sender: Any) {
        
        var a = Int(Firs_number.text!)
        var b = Int(second_Nunber.text!)
        Result.text = "\(a!) + \(b!) = \(a!+b!)"
        
        view.endEditing(true)
        
        Firs_number.text = ""
        second_Nunber.text = ""
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

