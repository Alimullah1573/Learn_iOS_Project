import UIKit
import PhotosUI

class DetailsVC: UIViewController {
    // MARK: ---------- Outlet  ---------------
    @IBOutlet weak var folderNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: -------- Variable ----------
    var folderName: String!
    var images: [UIImage] = []
    // MARK: ----------  LifeCycle ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        folderNameLabel.text = folderName
        navigationController?.navigationBar.isHidden = true
        self.initCall()
        
        // 🔥 Delete Notification observe
        NotificationCenter.default.addObserver(self,selector: #selector(removeDeletedImage(_:)),name: NSNotification.Name("DeleteImage"),object: nil)
    }
    
    // MARK: ---------- PrivateFunction  ---------------
    private func initCall(){
        
        self.setupCollectionView()
        self.loadImages()  // start  load
    }
    // MARK: SetupCollectionView
    private func setupCollectionView() {
        collectionView.register(DetailsCVCell.nib(), forCellWithReuseIdentifier: DetailsCVCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: LoadImage
    private func loadImages() {
        DispatchQueue.global(qos: .userInitiated).async {
            let loaded = FileHelper.shared.loadImages(from: self.folderName)
            DispatchQueue.main.async {
                self.images = loaded
                // Smooth animation reload
                UIView.transition(with: self.collectionView,duration: 0.1,options: .transitionCrossDissolve,animations: { self.collectionView.reloadData() },completion: nil)
            }
        }
    }
    
    // MARK: ---------- ButtonAction  ---------------
    // MARK: - Picker Open
    @IBAction func openPickerBtn(_ sender: UIButton) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0   // একাধিক select করা যাবে
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    ///  Mark: navigationController?.popViewController
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func removeDeletedImage(_ notification: Notification) {
        if let image = notification.object as? UIImage,
           let index = images.firstIndex(of: image) {
            
            // Array To remove
            images.remove(at: index)
            
            // CollectionView To remove
            collectionView.deleteItems(at: [IndexPath(item: index, section: 0)])
 
            // FileHelper To remove
            FileHelper.shared.deleteImage(image, from: folderName)
        }
    }
    
}

// MARK:  ---------- extension -----------
extension DetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // MARK: CellForItem
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCVCell.identifier, for: indexPath) as? DetailsCVCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = images[indexPath.item]
        return cell
    }
    //MARK: DidSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedImage = images[indexPath.item]
        
        let storyboard = UIStoryboard(name: "PreViewVC", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "PreViewVC") as? PreviewVC {
            vc.preViewImage = selectedImage
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

extension DetailsVC: UICollectionViewDelegateFlowLayout {
    // Set cell size
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 3        // 3 images per row
        let spacing: CGFloat = 3            // horizontal spacing
        let totalSpacing = (itemsPerRow - 1) * spacing
        let width = (collectionView.frame.width - totalSpacing) / itemsPerRow
        
        return CGSize(width: width, height: width) // Square cell
    }
    
    // Vertical spacing between rows
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    // Horizontal spacing between items
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}

// MARK: PHPickerViewControllerDelegate
extension DetailsVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    guard let self = self else { return }
                    if let img = image as? UIImage {
                        
                        // 1. Folder save
                        FileHelper.shared.saveImage(img, to: self.folderName)
                        
                        // 2. Array  add  End
                        DispatchQueue.main.async {
                            self.images.append(img)
                            
                            // 3. CollectionView just New cell insert
                            let newIndex = IndexPath(item: self.images.count - 1, section: 0)
                            self.collectionView.insertItems(at: [newIndex])
                        }
                    }
                }
            }
        }
    }
}
