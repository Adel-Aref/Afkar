//
//  SideMenuCell.swift
//  Afkar
//
//  Created by Other user on 6/12/18.
//  Copyright © 2018 Other user. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    @IBOutlet weak var lblSideMEnuItemName: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
