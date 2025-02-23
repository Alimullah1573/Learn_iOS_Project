//
//  ViewController.swift
//  exit Alert
//
//  Created by TwinBit Ltd on 12/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func ExitButton(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Hi Alert", message: "Do you want to exit this App", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Subscribe", style: .default, handler: {(_) in
            print("YES")
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: {(_) in
            exit(0)
            
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

