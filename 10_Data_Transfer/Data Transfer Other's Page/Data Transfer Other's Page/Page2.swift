//
//  Page2.swift
//  Data Transfer Other's Page
//
//  Created by TwinBit Ltd on 4/1/25.
//

import UIKit

class Page2: UIViewController {
    var k = ""
    var str = ""
    @IBOutlet weak var Output: UILabel!
    
    
    @IBOutlet weak var OTo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Output.text = str
        OTo.text = k
    }
    
}
    


