import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private var models = [Person]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load model
        configureModels()
        
        // Add table view
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        let names = ["Alice", "Bob", "Clara", "Daniel", "Eric", "Frank"]
        for name in names {
            models.append(Person(name: name))
        }
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let model = models[indexPath.row]
        cell.textLabel?.text = model.name
        
        return cell
    }
}
