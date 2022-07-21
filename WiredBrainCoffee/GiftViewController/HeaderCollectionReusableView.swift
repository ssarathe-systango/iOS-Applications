//
//  HeaderCollectionReusableView.swift
//  WiredBrainCoffee
//
//  Created by macmini01 on 21/07/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    func setup(count: Int) {
        headerLabel.text = "Movies: \(count)"
    }
}
