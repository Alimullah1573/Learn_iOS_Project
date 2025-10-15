//
//  HomeVC.swift
//  InfiniteCarousel
//
//  Created by MD Alimullah on 15/10/25.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var models: [MYModel] = [
        MYModel(name: "Alimullah", imageName: "1"),
        MYModel(name: "Rubel", imageName: "2"),
        MYModel(name: "Ashik", imageName: "3"),
        MYModel(name: "Rejaul", imageName: "4"),
        MYModel(name: "Tuhin", imageName: "5"),
        ]
    
    var timer: Timer?
    var totalItems = 0
    var currentIndex = 0
    
    // MARK: backgroundImageView, blurView
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let bv = UIVisualEffectView(effect: blurEffect)
        bv.translatesAutoresizingMaskIntoConstraints = false
        return bv
    }()


    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initCall()
    }
    
    // MARK: ---- Private function
    private func initCall(){
        self.backgroundImage()
        self.setupCollectionView()
        self.midToStartScrolling()
        self.startAutoScroll()
        
    }
    
    // MARK: ---- Setup CollectionView
    func setupCollectionView(){
        collectionView.register(CustomCVCell.nib(), forCellWithReuseIdentifier: CustomCVCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    // MARK: ---- startAutoScroll
    
    func startAutoScroll() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextItem() {
        currentIndex += 1
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        // Update background ------------------
         let model = models[currentIndex % models.count]
         UIView.transition(with: backgroundImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
             self.backgroundImageView.image = UIImage(named: model.imageName)
         }, completion: nil)
        //--------------------------
        
        // If you go to Tangail a lot, secretly bring a lot in the middle
        if currentIndex >= totalItems - 10 {
            currentIndex = totalItems / 2
            let newIndexPath = IndexPath(item: currentIndex, section: 0)
            collectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    // MARK: Dublicate Carete AutoScrolling
    func midToStartScrolling(){
        totalItems = models.count * 100   // Dublicate
        collectionView.reloadData()
        
        // mid to Start
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let middleIndex = self.totalItems / 2
            let indexPath = IndexPath(item: middleIndex, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self.currentIndex = middleIndex
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    
    func backgroundImage(){
        
        // 1. Background Image
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // 2. Blur
        backgroundImageView.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor)
        ])
        
        // Bring collectionView to front
        view.bringSubviewToFront(collectionView)
        
    }
}


extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVCell.identifier, for: indexPath) as? CustomCVCell else {
            return UICollectionViewCell()
        }
        let model = models[indexPath.row % models.count]
        cell.imageView.image = UIImage(named: model.imageName)
        cell.nameLabel.text = model.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let model = models[currentIndex % models.count]
        backgroundImageView.image = UIImage(named: model.imageName)
    }

}
