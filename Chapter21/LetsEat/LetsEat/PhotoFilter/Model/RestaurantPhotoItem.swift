//
//  RestaurantPhotoItem.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 14/12/2021.
//

import UIKit
struct RestaurantPhotoItem {
    var date: Date?
    var photo: UIImage?
    var photoData: Data {
        guard let photo = photo, let photoData = photo.pngData() else {
            return Data()
        }
        return photoData
    }
    var restaurantID: Int64?
    var uuid = UUID()
}
extension RestaurantPhotoItem {
    init(restaurantPhoto: RestaurantPhoto) {
        self.date = restaurantPhoto.date
        if let restPhoto = restaurantPhoto.photo {
            self.photo = UIImage(data: restPhoto, scale: 1.0)
        }
        self.restaurantID = restaurantPhoto.restaurantID
        if let restPhotoUUID = restaurantPhoto.uuid {
            self.uuid = restPhotoUUID
        }
    }
}
