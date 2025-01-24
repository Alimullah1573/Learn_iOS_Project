//
//  ViewController.swift
//  add AutoLayout Constraints Programmatically
//
//  Created by Alimullah on 24/1/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Create the subview
         let myView = UIView()
         myView.backgroundColor = .blue
        
        myView.layer.cornerRadius = 20
         myView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(myView)
         
         // Add constraints using anchors
         NSLayoutConstraint.activate([
             myView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),   // Top: 50px
             myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Leading: 20px
             myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // Trailing: -20px
             myView.heightAnchor.constraint(equalToConstant: 100)  // Height: 100px
         ])
        
        
    }


}

