//
//  ViewController.swift
//  CollectionView_Header_Footer
//
//  Created by MD Alimullah on 18/10/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var image_Name = ["1","2","3","4","1","2","3","1","2","3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initCall()
    }

    
    
    private func initCall(){
        self.setUpCollectionView()
        
    }
    
    func setUpCollectionView(){
        
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifire)
        
        collectionView.register(CVHeaderCell.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CVHeaderCell.identifire)
        
        collectionView.register(CollectionReusableViewFooterCell
            .nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter , withReuseIdentifier: CollectionReusableViewFooterCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}


extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image_Name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifire, for: indexPath) as! CollectionViewCell
        
        cell.configur(imageName: image_Name[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let header  =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CVHeaderCell.identifire, for: indexPath) as! CVHeaderCell
            header.text.text = "HeaderCell"
            return header
        } else {
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableViewFooterCell.identifire, for: indexPath) as! CollectionReusableViewFooterCell
            footer.name.text = "This is FooterCell"
            return footer
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 400)
    }
    
}
