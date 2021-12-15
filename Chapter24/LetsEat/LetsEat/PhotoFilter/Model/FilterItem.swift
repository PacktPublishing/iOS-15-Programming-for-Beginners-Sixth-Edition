//
//  FilterItem.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 14/12/2021.
//

import Foundation

struct FilterItem {
    let filter: String?
    let name: String?
    init(dict: [String: String]) {
        self.filter = dict["filter"]
        self.name = dict["name"]
    }
}
