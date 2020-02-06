
import UIKit

class todoListViewController: UITableViewController {
    
    // MARK --> The start array
    var itemArray = ["Find Milk","Buy Eggs","DestroyDemogoinig","A","B","C","D","E","F","G","H","I","J","K","L"]
    
    // MARK --> Declearation of userDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // MARK --> Decleration variables call tech if userdefaults and array
        if let item = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = item
        }
    }

// MARK -- table view Data source Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK -- table view Deleget Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - add button item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let Alert = UIAlertController.init(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let Action = UIAlertAction.init(title: "Add Item", style: .destructive) { (action) in
            
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
    // What happen when user click on this button
        
        Alert.addTextField { (alertTextField) in
            textField.placeholder = "Create New Item"
            textField = alertTextField
        }
        Alert.addAction(Action)
        present(Alert, animated: true, completion: nil)
    }
}

