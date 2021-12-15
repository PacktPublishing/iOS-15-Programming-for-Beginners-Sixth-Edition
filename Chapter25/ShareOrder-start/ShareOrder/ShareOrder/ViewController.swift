//
//  ViewController.swift
//  ShareOrder
//
//  Created by iOS 15 Programming on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var orders: [String] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ShareOrder"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "orderCell")
    }
    
    @IBAction func addOrder(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Order", message: "Add a new order", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first, let orderToSave = textField.text else {
                return
            }
            self.orders.append(orderToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        cell.textLabel?.text = orders[indexPath.row]
        return cell
    }
    
}
