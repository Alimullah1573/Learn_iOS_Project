//
//  ViewController.swift
//  pickerview
//
//  Created by Alimullah on 17/1/25.
//

import UIKit
var country = ["Bangladesh", "Pakistan","Argentina","Brazil","croatia"]

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBOutlet weak var pickerview: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return output.text = country[row]
    }
    
    
}

