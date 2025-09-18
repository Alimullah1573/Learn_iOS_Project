//
//  PreviewVC.swift
//  ExploringFileManager
//
//  Created by Alimullah on 16/9/25.
//

import UIKit

class PreviewVC: UIViewController {
    // MARK: -------- Outlet -----------
    @IBOutlet weak var preImageView : UIImageView!
    
    @IBOutlet weak var btn: UIButton!{
        didSet{
            btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        }
    }
    // MARK: -------- Varable -----------
    var preViewImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        preImageView.image = preViewImage
        // Tap gesture for Delete & Share
         let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
         preImageView.isUserInteractionEnabled = true
         preImageView.addGestureRecognizer(tap)
     }
     
     @objc func btnTapped() {
         dismiss(animated: true)
     }
     
     @objc func imageTapped() {
         let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         
         let delete = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
             self?.deleteImage()
         }
         
         let share = UIAlertAction(title: "Share", style: .default) { [weak self] _ in
             self?.shareImage()
         }
         
         let cancel = UIAlertAction(title: "Cancel", style: .cancel)
         
         alert.addAction(delete)
         alert.addAction(share)
         alert.addAction(cancel)
         
         // iPad support
         if let popover = alert.popoverPresentationController {
             popover.sourceView = self.preImageView
             popover.sourceRect = self.preImageView.bounds
         }
         
         present(alert, animated: true)
     }
    // MARK: ------ deletImage --------
    private func deleteImage() {
        if let image = preViewImage {
            NotificationCenter.default.post(name: NSNotification.Name("DeleteImage"), object: image)
        }
        dismiss(animated: true)
    }

        // MARK: ------ shareImage --------
     private func shareImage() {
         guard let image = preViewImage else { return }
         let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
         
         if let popover = activityVC.popoverPresentationController {
             popover.sourceView = self.preImageView
             popover.sourceRect = self.preImageView.bounds
         }
         
         present(activityVC, animated: true)
     }
 }
