//
//  ReviewFormViewController.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 14/12/2021.
//

import UIKit

class ReviewFormViewController: UITableViewController {
    
    var selectedRestaurantID: Int?
    
    @IBOutlet var ratingsView: RatingsView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var reviewTextView: UITextView!

    override func viewDidLoad() {
        print(selectedRestaurantID as Any)
        super.viewDidLoad()
    }

}

private extension ReviewFormViewController {
    @IBAction func onSaveTapped(_ sender: Any) {
        var reviewItem = ReviewItem()
        reviewItem.rating = ratingsView.rating
        reviewItem.title = titleTextField.text
        reviewItem.name = nameTextField.text
        reviewItem.customerReview = reviewTextView.text
        if let selRestID = selectedRestaurantID {
            reviewItem.restaurantID = Int64(selRestID)
        }
        CoreDataManager.shared.addReview(reviewItem)
        dismiss(animated: true, completion: nil)
    }
}
