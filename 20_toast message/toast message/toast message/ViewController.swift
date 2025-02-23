//
//  ViewController.swift
//  toast message
//
//  Created by TwinBit Ltd on 5/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func Toast(_ sender: Any) {
        
        showToast()
        
    }
    
    func showToast(){
        let ToastMessage = UILabel()
        ToastMessage.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        
        ToastMessage.text = "I Love you  Bangladesh"
        ToastMessage.textAlignment = .center
        ToastMessage.backgroundColor = UIColor.brown
        ToastMessage.textColor = UIColor.white
        self.view.addSubview(ToastMessage)
        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseOut, animations: {
            ToastMessage.alpha = 0.0
            
        }) { (iscompleted) in
            ToastMessage.removeFromSuperview()
            
            
            
        }
        
        
    }
    
}
