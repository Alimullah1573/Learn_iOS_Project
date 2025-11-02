//
//  CustomCVCell.swift
//  Kingfisher
//
//  Created by MD Alimullah on 2/11/25.
//

import UIKit

class CustomCVCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "CustomCVCell"
    static func nib() -> UINib{
        
        return UINib(nibName: "CustomCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
