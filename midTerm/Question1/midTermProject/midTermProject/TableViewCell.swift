//
//  TableViewCell.swift
//  midTermProject
//
//  Created by E Z on 3/18/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    var wonderName = ""
    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var lblImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
