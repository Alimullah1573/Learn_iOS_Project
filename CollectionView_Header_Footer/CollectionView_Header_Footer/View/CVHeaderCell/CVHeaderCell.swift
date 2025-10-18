//
//  CVHeaderCell.swift
//  CollectionView_Header_Footer
//
//  Created by MD Alimullah on 18/10/25.
//

import UIKit

class CVHeaderCell: UICollectionReusableView {
    
    @IBOutlet weak var text: UILabel!
    
    static let identifire = "CVHeaderCell"
    static func nib() -> UINib{
        
        return UINib(nibName: "CVHeaderCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
