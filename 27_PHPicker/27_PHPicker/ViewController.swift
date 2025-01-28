//
//  ViewController.swift
//  27_PHPicker
//
//  Created by Alimullah on 28/1/25.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, PHPickerViewControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        dismiss(animated: true, completion: nil)
        
        for item in results{
            item.itemProvider.loadObject(ofClass: UIImage.self) {
                (image,error) in
                
                if let image = image as? UIImage {
                    print(image)
                    
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                    
                }
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func addPhoto(_ sender: Any) {
        presentationPickerViw()
    }
    
    func presentationPickerViw(){
        
        var configuration:PHPickerConfiguration = PHPickerConfiguration()
        
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 0
        
        let picker: PHPickerViewController = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    
    

}

