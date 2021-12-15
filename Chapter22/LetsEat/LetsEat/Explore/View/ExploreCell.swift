//
//  ExploreCell.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 05/11/2021.
//

import UIKit

class ExploreCell: UICollectionViewCell {
    
    @IBOutlet var exploreNameLabel: UILabel!
    @IBOutlet var exploreImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exploreImageView.layer.cornerRadius = 9
        exploreImageView.layer.masksToBounds = true
        
    }
    
}
