//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 13/12/2021.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant: RestaurantItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
    }
    
    
}
