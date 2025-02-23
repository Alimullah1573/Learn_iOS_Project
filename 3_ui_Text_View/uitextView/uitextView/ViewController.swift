//
//  ViewController.swift
//  uitextView
//
//  Created by TwinBit Ltd on 3/1/25.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var Text_View: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        Text_View.layer.cornerRadius = 10
        
        Text_View.layer.backgroundColor = UIColor.green.cgColor
        
        Text_View.layer.borderColor = UIColor.red.cgColor
        
        Text_View.layer.borderWidth = 5
    }


}

