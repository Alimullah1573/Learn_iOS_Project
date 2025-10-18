//
//  CollectionViewCell.swift
//  CollectionView_Header_Footer
//
//  Created by MD Alimullah on 18/10/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    static let identifire = "CollectionViewCell"
    static func nib() -> UINib{
        
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configur(imageName: String){
        imageView.image = UIImage(named: imageName)
        
    }

}
