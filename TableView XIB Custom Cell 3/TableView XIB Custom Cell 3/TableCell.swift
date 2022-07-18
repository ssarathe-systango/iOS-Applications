//
//  MyTableCell.swift
//  TableView XIB Custom Cell 3
//
//  Created by macmini01 on 13/07/22.
//

import UIKit

class TableCell: UITableViewCell {
    

    @IBOutlet weak var labelObj: UILabel!
    @IBOutlet weak var imageObj: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
