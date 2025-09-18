


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataModel: [ToDoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData ToDo List"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        
        fetchData()
        print("data : ", self.dataModel)
    }
    
    private func fetchData() {
        self.dataModel = CoreDataManager.shared.fetchAllItems()
        self.tableView.reloadData()
    }
    
    @IBAction func didTapAdd(_ sender: UIButton) {
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak self] _ in
            guard let self = self,
                  let field = alert.textFields?.first,
                  let text = field.text, !text.isEmpty else { return }
            
            let model = ToDoModel(
                id: UUID(),
                name: text,
                createdAt: Date(),
                orderIndex: Int64(self.dataModel.count)
            )
            
            CoreDataManager.shared.createItem(model: model)
            self.fetchData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = model.name
          
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        cell.detailTextLabel?.text = formatter.string(from: model.createdAt)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataModel[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sheet = UIAlertController(title: "Options", message: "Edit or Delete this item", preferredStyle: .actionSheet)
        
        // Cancel
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Edit
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            let editAlert = UIAlertController(title: "Edit Item", message: "Update your text", preferredStyle: .alert)
            editAlert.addTextField { textField in
                textField.text = item.name
            }
            editAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
                guard let newText = editAlert.textFields?.first?.text, !newText.isEmpty else { return }
                
                var updatedItem = self.dataModel[indexPath.row]
                updatedItem.name = newText
                
                CoreDataManager.shared.updateItem(model: updatedItem)
                self.fetchData()
            }))
            editAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(editAlert, animated: true)
        }))
        
        // Delete
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            guard let self = self else { return }
            CoreDataManager.shared.deleteItem(model: self.dataModel[indexPath.row])
            self.fetchData()
        }))
        
        present(sheet, animated: true)
    }
}

// MARK: - UITableViewDragDelegate
extension ViewController: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.dataModel[indexPath.row].name
        let itemProvider = NSItemProvider(object: item as NSString)
        return [UIDragItem(itemProvider: itemProvider)]
    }
    
    // Allow all rows to be movable
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Save new order in CoreData
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = dataModel.remove(at: sourceIndexPath.row)
        dataModel.insert(movedItem, at: destinationIndexPath.row)
        
        // ✅ Update orderIndex for all items
        for (index, _) in dataModel.enumerated() {
            dataModel[index].orderIndex = Int64(index)
        }
        
        // ✅ Save updated order to CoreData
        CoreDataManager.shared.updateOrder(for: dataModel)
        print("data update: ", self.dataModel)
    }
}


// MARK: - Row Height
extension ViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100   // Every Cell Height
    }
}
