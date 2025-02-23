import UIKit

class tableview: UITableViewController {
    
    var country = ["Bangladesh", "India", "Argentina", "Brazil", "Croatia"]
    var myindex = 0

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = country[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myindex = indexPath.row
        performSegue(withIdentifier: "page2", sender: self)
    }
    
    // Prepare for segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "page2" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.selectedCountry = country[myindex]
        }
    }
}
