//
//  FilterDataManager.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 14/12/2021.
//

import Foundation

class FilterDataManager: DataManager {
    func fetch() -> [FilterItem] {
        var filterItems: [FilterItem] = []
        for data in loadPlist(file: "FilterData") {
            filterItems.append(FilterItem(dict: data as! [String: String]))
        }
        return filterItems
    }
}
