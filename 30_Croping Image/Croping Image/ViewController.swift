//
//  ViewController.swift
//  Croping Image
//
//  Created by Alimullah on 22/2/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: OUTLET
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.layer.borderWidth = 2
         self.image.layer.backgroundColor = UIColor.clear.cgColor
         self.image.layer.masksToBounds = false
         self.image.layer.cornerRadius = image.frame.size.height/2
         self.image.clipsToBounds = true
        
        // MARK: Metho Calling
        AddtapGasture()
        
    }
    
    // MARK: ADD Tap Gasture From The ImageView
    func AddtapGasture(){
        let tap = UITapGestureRecognizer(target: self , action: #selector(ImageTapped))
        self.image.isUserInteractionEnabled = true
        self.image.addGestureRecognizer(tap)
    }
    
    // MARK: @objec
    
    @objc func ImageTapped(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true,completion: nil)
    }
    
    
}



// MARK: Extension UINavigationControllerDelegate, UIImagePickerControllerDelegate

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let picking = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.image.image = picking
        dismiss(animated: true, completion: nil)
    }
}
 
