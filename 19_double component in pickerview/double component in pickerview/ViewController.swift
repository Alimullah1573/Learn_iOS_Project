//
//  ViewController.swift
//  double component in pickerview
//
//  Created by Alimullah on 19/1/25.
//

import UIKit

var country = ["Bangladesh","India","Argentina","Brazil"]

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var output1: UILabel!
    

    @IBOutlet weak var output2: UILabel!
    

    @IBOutlet weak var pickerview: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0{
            output1.text = country[row]
        }
        if component == 1 {
            output2.text = country[row]
        }
    }
    
    
}

