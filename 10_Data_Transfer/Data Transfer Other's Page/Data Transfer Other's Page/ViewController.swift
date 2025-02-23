//
//  ViewController.swift
//  Data Transfer Other's Page
//
//  Created by TwinBit Ltd on 4/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var inpt_: UITextField!
    @IBAction func PassData(_ sender: Any) {
        
        if input.text != "" {
            performSegue(withIdentifier: "second", sender: self)
        } else {
            print("IS Empty")
        }
        
      
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let obj = segue.destination as! Page2
        
        obj.str = input.text!
        
        obj.k = inpt_.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

