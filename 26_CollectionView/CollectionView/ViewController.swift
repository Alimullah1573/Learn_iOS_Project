//
//  ViewController.swift
//  CollectionView
//
//  Created by Alimullah on 28/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var images : [String] = ["argentina","bangladesh","brazil","Croatia","island","Jarmani","dj","ar","us"]
    
    var countrayName: [String] =  ["Argentina","Bangladesh","Brazil","Croatia","Island","Jarmani","DJ","AR","US"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        
        cell.Titel_.text = countrayName[indexPath.row]

        cell.imageView.image = UIImage(named: images[indexPath.row])
        
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width-10)/2
        
        
        return CGSize(width: size, height: size)
    }
    
    
    

    
}





// other's code


/*
 
 //
 //  ViewController.swift
 //  New_PHP
 //
 //  Created by Alimullah on 30/1/25.
 //

 import UIKit

 class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return countray.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
         
         cell.imageView.image =  UIImage(named: countray[indexPath.row])
         
         return cell
     }
     
     
     var countray: [String] = ["ar","argentina","ar"]

     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         
         
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.collectionViewLayout = UICollectionViewFlowLayout()
     }
     
     
     
     @IBOutlet weak var collectionView: UICollectionView!
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let size = (collectionView.frame.width-10)/2
         
         return CGSize(width: size, height: size)
     }
     
     
     
     
     

 }


 */
