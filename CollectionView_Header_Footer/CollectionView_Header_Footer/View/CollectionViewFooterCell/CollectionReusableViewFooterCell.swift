//
//  CollectionReusableViewFooterCell.swift
//  CollectionView_Header_Footer
//
//  Created by MD Alimullah on 18/10/25.
//

import UIKit

class CollectionReusableViewFooterCell: UICollectionReusableView {
    @IBOutlet weak var name: UILabel!
    
    static let identifire = "CollectionReusableViewFooterCell"
    static func nib() -> UINib{
        
        return UINib(nibName: "CollectionReusableViewFooterCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
