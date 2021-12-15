//
//  ViewController.swift
//  ShareOrder
//
//  Created by iOS 15 Programming on 28/07/2021.
//

import UIKit
import GroupActivities

class ViewController: UIViewController {
    
    var orders: [String] = []
    var groupSession: GroupSession<ShareOrder>?
    var messenger: GroupSessionMessenger?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ShareOrder"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "orderCell")
        Task {
            for await session in ShareOrder.sessions() {
                configureGroupSession(session)
            }
        }
    }
    
    
    @IBAction func activateGroupActivity(_ sender: Any) {
        Task {
            do {
                try await ShareOrder().activate()
            } catch {
                print("Unable to activate")
            }
        }
    }
    
    @IBAction func addOrder(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Order", message: "Add a new order", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first, let orderToSave = textField.text else {
                return
            }
            self.orders.append(orderToSave)
            if let messenger = messenger {
                Task {
                    do {
                        try await messenger.send(orderToSave)
                    } catch {
                        print("Failed to send")
                    }
                }
            }
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

extension ViewController {
    
    struct ShareOrder: GroupActivity {
        var metadata: GroupActivityMetadata {
            var metadata = GroupActivityMetadata()
            metadata.title = NSLocalizedString("ShareOrder", comment: "Title of group activity")
            metadata.type = .generic
            return metadata
        }
    }
    
    func configureGroupSession(_ groupSession: GroupSession<ShareOrder>) {
        orders.removeAll()
        self.groupSession = groupSession
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        Task.detached { [weak self] in
            for await (message, _) in messenger.messages(of: String.self) {
                await self?.handle(message)
            }
        }
        groupSession.join()
    }
    
    func handle(_ message: String) {
        self.orders.append(message)
        self.tableView.reloadData()
    }
 }
