import UIKit

class ViewController: UIViewController {
    // MARK: ----------- Outlet -------------
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: ----------- Variable -------------
    var folders: [String] = [] // Just Name
    // MARK: ----------- Life Cycle -------------
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Root Folder Path:", FileHelper.shared.rootFolder.path)
        self.initCall()
    }
    
    // MARK: ----------- Private Function -------------
    private func initCall(){
        self.setupCollectionView()
        self.loadFoldersFromDirectory()
    }
    
    // MARK: - CollectionView Setup
    private func setupCollectionView() {
        collectionView.register(FolderCell.nib(), forCellWithReuseIdentifier: FolderCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: ---------- ButtonAction  ---------------
    // MARK: - Add Folder Button
    @IBAction func addFolderTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Folder", message: "Enter folder name", preferredStyle: .alert)
        alert.addTextField { tf in tf.placeholder = "Folder Name" }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let add = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self = self, let name = alert.textFields?.first?.text, !name.isEmpty else { return }
            FileHelper.shared.createFolder(name: name)
            self.loadFoldersFromDirectory()
            self.collectionView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(add)
        present(alert, animated: true)
    }
    
    // MARK: -------- Load folders from RootFolder -----------
    private func loadFoldersFromDirectory() {
        folders = FileHelper.shared.getAllFolders()
    }
}

// MARK: ---------- Extension  ---------------

// MARK: ---------- CollectionView UICollectionViewDelegate, UICollectionViewDataSource --------------
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: --------  numberOfItemsInSection -----------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return folders.count
    }
    // MARK: -------- cellForItemAt  -----------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FolderCell.identifier, for: indexPath) as? FolderCell else {
            return UICollectionViewCell()
        }
        let folderName = folders[indexPath.item]
        cell.lblFolderName.text = folderName
        cell.deleteAction = { [weak self] in
            guard let self = self else { return }
            FileHelper.shared.deleteFolder(name: folderName)
            self.loadFoldersFromDirectory()
            self.collectionView.reloadData()
        }
        return cell
    }
    
    // MARK: -------- didSelectItemAt ----------
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "DetailsVC", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC else { return }
        vc.folderName = folders[indexPath.item]
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    // MARK: -------- sizeForItemAt ----------
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalSpacing: CGFloat = 10   // 5 left + 5 right (horizontal gaps)
        let interItemSpacing: CGFloat = 10  // 5 + 5 between 3 items = 10
        let itemsInRow: CGFloat = 3
        
        let width = (collectionView.frame.width - totalSpacing - interItemSpacing) / itemsInRow
        
        return CGSize(width: width, height: width)  // height = width দিলে square হবে
    }
    
    // MARK: - Line Spacing (vertical gap)
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // MARK: - Inter Item Spacing (horizontal gap)
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
