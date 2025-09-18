//
//  DetailsCVCell.swift
//  ExploringFileManager
//
//  Created by Alimullah on 16/9/25.
//

import UIKit

class DetailsCVCell: UICollectionViewCell {
    @IBOutlet  weak var imageView: UIImageView!
    
    static let identifier = "DetailsCVCell"
    static func nib() -> UINib {
        return UINib(nibName: "DetailsCVCell", bundle: nil)
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
