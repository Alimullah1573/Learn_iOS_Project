//
//  ViewController.swift
//  Alert input
//
//  Created by TwinBit Ltd on 8/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Output: UILabel!
    
    
    @IBAction func showAlert(_ sender: Any) {
        
        
        var alert = UIAlertController(title: "Please Input", message: "Input here", preferredStyle: .alert)
        alert.addTextField {(addTextfild) in
            addTextfild.placeholder = "Enter Phone number"
            addTextfild.textAlignment = .center
        }
        
        alert.addTextField {(addTextFilde) in
            addTextFilde.placeholder = "Enter Password"
            addTextFilde.textAlignment = .center
            addTextFilde.isSecureTextEntry = true
        }
        
        alert.addAction(UIAlertAction(title: "Enter", style: .destructive, handler: {
            (_) in
            var name = alert.textFields?[0].text
            var pasword = alert.textFields?[1].text
            self.Output.text = "Name: \(name!) , Password: \(pasword!)"
        }))
        alert.addAction(UIAlertAction(title: "Cencel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

