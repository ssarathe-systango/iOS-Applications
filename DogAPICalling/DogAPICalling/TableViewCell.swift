//
//  TableViewCell.swift
//  DogAPICalling
//
//  Created by macmini01 on 03/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var breadsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
