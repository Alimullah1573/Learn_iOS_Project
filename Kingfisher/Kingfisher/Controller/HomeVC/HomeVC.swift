//
//  HomeVC.swift
//  Kingfisher
//
//  Created by MD Alimullah on 2/11/25.
//

import UIKit
import  Kingfisher
class HomeVC: UIViewController {

    // MARK: Package = https://github.com/onevcat/Kingfisher.git

      let imageURLs = [
          "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=1000&q=80",
          "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=1000&q=80",
          "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=1000&q=80",
          "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=1000&q=80",
          "https://images.unsplash.com/photo-1501973801540-537f08ccae7b?w=1000&q=80",
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80",
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80",
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80",
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80",
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80",
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1000&q=80"
      ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        
    }
    
    
    func setupCollectionView(){
        collectionView.register(CustomCVCell.nib(), forCellWithReuseIdentifier: CustomCVCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
       
        
    }


}


extension HomeVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVCell.identifier, for: indexPath) as! CustomCVCell
        if let url = URL(string: imageURLs[indexPath.row]){
            cell.imageView.kf.setImage(with: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 350)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

