//
//  ViewController.swift
//  Auto Layout
//
//  Created by Alimullah on 21/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    var data = ""
    
    @IBOutlet weak var output: UILabel!
    
    @IBOutlet weak var T: UIButton!
    
    @IBOutlet weak var input: UITextField!
    

    @IBAction func Touch(_ sender: Any) {
        
        
        //output.text = "\(String(describing: input.text))"
        
        output.text = "\((input.text)!)"
        
        input.text = ""
        
        view.endEditing(true)
    
    }
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        output.layer.cornerRadius = 70
        input.layer.borderWidth = 5
        input.layer.cornerRadius = 10
        
        T.layer.borderWidth = 5
        T.layer.cornerRadius = 10
       
    
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

