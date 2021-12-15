//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 05/11/2021.
//

import Foundation

class ExploreDataManager: DataManager {
    
    private var exploreItems: [ExploreItem] = []
    
    func fetch() {
        for data in loadPlist(file: "ExploreData") {
            exploreItems.append(ExploreItem(dict: data as! [String: String]))
        }
    }
    
    func numberOfExploreItems() -> Int {
        exploreItems.count
    }
    
    func exploreItem(at index: Int) -> ExploreItem {
        exploreItems[index]
    }
}
