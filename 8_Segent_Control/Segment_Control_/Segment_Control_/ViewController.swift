//
//  ViewController.swift
//  Segment_Control_
//
//  Created by TwinBit Ltd on 31/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var S_Control: UISegmentedControl!
    
    
    @IBAction func SAction(_ sender: Any) {
        
        switch S_Control.selectedSegmentIndex{
        case 0:
            view.backgroundColor = UIColor.red
        case 1:
            view.backgroundColor = UIColor.green
        case 2:
            view.backgroundColor = UIColor.yellow
        case 3:
            view.backgroundColor = UIColor.black
        default:
            print("NO")
        }
    }
}

