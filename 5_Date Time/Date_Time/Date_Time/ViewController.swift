//
//  ViewController.swift
//  Date_Time
//
//  Created by TwinBit Ltd on 29/12/24.
//

import UIKit

let date = Date()
let calender = Calendar.current

var year = calender.component(.year, from: date)
var month = calender.component(.month, from: date)
var day = calender.component(.day, from: date)

var T = (DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short))



class ViewController: UIViewController {
    
    @IBOutlet weak var Time_: UITextField!
    @IBOutlet weak var Day: UITextField!
    
    @IBOutlet weak var Month: UITextField!
    
    @IBOutlet weak var Year: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Day.text = "\(day)"
        Month.text = "\(month)"
        Year.text = "\(year)"
        Time_.text = "\(T)"
        // Do any additional setup after loading the view.
    }


}

