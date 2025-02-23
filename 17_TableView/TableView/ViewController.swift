//
//  ViewController.swift
//  TableView
//
//  Created by Alimullah on 16/1/25.
///

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    var selectedCountry: String? // `tableview` থেকে ডেটা রিসিভের জন্য

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if `selectedCountry` is not nil
        if let country = selectedCountry {
            // Set the label text
            output.text = "selected Country : \(country)"
            
            // Set the image based on the country name
            let imageName = country.lowercased() // Example: "bangladesh" -> "bangladesh.png"
            imageview.image = UIImage(named: imageName)
        }
    }
}
