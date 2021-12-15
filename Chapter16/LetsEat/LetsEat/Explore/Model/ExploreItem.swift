//
//  ExploreItem.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 05/11/2021.
//

import Foundation

struct ExploreItem {
    
    let name: String?
    let image: String?
    
}

extension ExploreItem {
    
    init(dict: [String: String]) {
        
        self.name = dict["name"]
        self.image = dict["image"]
        
    }
}
