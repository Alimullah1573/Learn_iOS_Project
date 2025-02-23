//
//  ViewController.swift
//  Progress View
//
//  Created by TwinBit Ltd on 3/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    var min_Time = 0.0
    
    var max_Time = 10.0

    
    @IBOutlet weak var Progress: UIButton!
    @IBOutlet weak var Disply: UILabel!
    
    
    @IBOutlet weak var Progress_View: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Progress.layer.cornerRadius = 40
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Progressing(_ sender: Any) {
        
        UpdateProgress()
        
    }
    
    @objc func UpdateProgress(){
        min_Time += 0.5
        Progress_View.progress = Float(min_Time / max_Time)
        Disply.text = "\(min_Time)%"
        
        if min_Time < max_Time {
            perform(#selector(UpdateProgress), with: nil, afterDelay: 0.1)
        }
        else {
            print("STOP")
            min_Time = 0.0
        }
        
        
    }
    


}

