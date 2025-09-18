//
//  FolderCell.swift
//  DocomentDirectoryTest
//
//  Created by Alimullah on 17/9/25.
//

import UIKit

class FolderCell: UICollectionViewCell {
    
    @IBOutlet weak var lblFolderName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    static let identifier = "FolderCell"
    
    var deleteAction: (() -> Void)?
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        deleteAction?()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FolderCell", bundle: nil)
    }
}
