//
//  ViewController.swift
//  Button And Label 2
//
//  Created by Alimullah on 6/2/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlet
    @IBOutlet weak var output: UILabel!
    
    
    // MARK: Variable
    var (x,y) = (1, 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// MARK: Button
    
    
    @IBAction func button(_ sender: Any) {
        
        if (y % 2) != 0{
            output.text = "\(x)"
            x += 1 ; y += 1
        } else{
            
            output.text = "- \(x)"
            y += 1
        }
        
    }
    
    
}





/*
 
 //
 //  ViewController.swift
 //  Table
 //
 //  Created by Alimullah on 6/2/25.
 //

 import UIKit

 class ViewController: UIViewController {
     
     var y = 1
     var isNegative = false
     
     @IBOutlet weak var output: UILabel!
     
     
     @IBAction func button(_ sender: Any) {
         if isNegative {
             output.text = "-\(y)" // Show negative of y
             y += 1 // Move to next number after showing the negative
         } else {
             output.text = "\(y)" // Show positive of y
         }
         
         isNegative.toggle()
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }


 }
 */
