/*
// Auto Layout System Button Create
import UIKit
var b: UIButton{
    let button = UIButton(type: .system)
    
    
    button.setTitle("Firs Button", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor =  .green
    button.layer.cornerRadius = 20
    button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
    //button.translatesAutoresizingMaskIntoConstraints = false
    return button
    
};
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(b)

    }
    
}

*/



// // Auto Layout Constraints


import UIKit

class ViewController: UIViewController {
    private lazy var b: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("First Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)   // Action Create
        
        
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(b)
        
        // Auto Layout Constraints
        NSLayoutConstraint.activate([
            b.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            b.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            b.widthAnchor.constraint(equalToConstant: 200),
            b.heightAnchor.constraint(equalToConstant: 50)
        ])

       
    }
    
    @objc private func buttonTapped() {
           print("Button was tapped!")
       }
}
