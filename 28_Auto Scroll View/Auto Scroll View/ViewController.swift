//
//  ViewController.swift
//  Auto Scroll View
//
//  Created by Alimullah on 12/2/25.
//
/*
import UIKit

class ViewController: UIViewController {

    
    var name = ["Ali","Alimullah","Rejaul","Rabbi"]
    var name_:[UIColor] = [.red,.green , .black, .orange]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionView
        
        cell.imageView.image = UIImage(named: name[indexPath.row])
        
        return cell
    }
    
    
}



// MARK: - Auto-Scrolling
func startAutoScroll() {
    autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
}

@objc func autoScroll() {
    let nextIndex = (currentIndex + 1) % (colors.count * 100)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    currentIndex = nextIndex
}

deinit {
    autoScrollTimer?.invalidate()
}
}
*/

//
//  ViewController.swift
//  Auto Scroll View
//
//  Created by Alimullah on 12/2/25.
//

import UIKit

class ViewController: UIViewController {

    var name = ["Ali", "Alimullah", "Rejaul", "Rabbi","Ali","Rejaul"]
    var colors: [UIColor] = [.red, .green, .black, .orange]

    var autoScrollTimer: Timer?
    var currentIndex = 0

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        startAutoScroll()
    }

    // MARK: - Auto-Scrolling
    func startAutoScroll() {
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }

    @objc func autoScroll() {
        let nextIndex = (currentIndex + 1) % name.count
        let indexPath = IndexPath(item: nextIndex, section: 0)

        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        currentIndex = nextIndex
    }

    deinit {
        autoScrollTimer?.invalidate()
    }
}

// MARK: - UICollectionView Delegate & Data Source
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionView
        cell.imageView.image = UIImage(named: name[indexPath.row])

         // Set cell background color
      // Display name in label

        return cell
    }
}


