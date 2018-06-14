//
//  OferrCell.swift
//  /Users/other/Documents/Afkar/Afkar/OferrCell.swiftAfkar
//
//  Created by Other user on 6/11/18.
//  Copyright © 2018 Other user. All rights reserved.
//

import UIKit

class OferrCell: UITableViewCell {
    @IBAction func btnPressed(_ sender: Any) {
        var indexpath:IndexPath
        //print("index is \(indexpath.row)")
    }
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnMore: UIButton!

    @IBOutlet weak var imgRate1: UIImageView!
    @IBOutlet weak var imgRate2: UIImageView!
    @IBOutlet weak var imgRate3: UIImageView!
    @IBOutlet weak var imgRate4: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgRate5: UIImageView!
    @IBOutlet weak var lblOfferName: UILabel!
    @IBOutlet weak var imgOffer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        imgOffer.layer.borderColor = #colorLiteral(red: 0.4493891073, green: 0.3681206371, blue: 0.9120587759, alpha: 1)

        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderWidth = 2
        btnMore.layer.cornerRadius = 5
        btnMore.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnMore.layer.shadowOpacity = 60
        btnMore.layer.shadowColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        btnMore.layer.borderWidth = 2
        lblPrice.layer.cornerRadius = 5
        lblPrice.layer.borderWidth = 2
        lblPrice.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lblPrice.layer.shadowOpacity = 5
        lblPrice.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
