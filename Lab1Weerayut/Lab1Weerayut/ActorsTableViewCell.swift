//
//  ActorsTableViewCell.swift
//  Lab1Weerayut
//
//  Created by weerayut krungklng on 5/26/17.
//  Copyright © 2017 weerayut krungklng. All rights reserved.
//

import UIKit

class ActorsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
