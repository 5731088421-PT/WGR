//
//  ProfileImageTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/5/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView1: ProfileImageView!
    @IBOutlet weak var ProfileImageView2: ProfileImageView!
    @IBOutlet weak var ProfileImageView3: ProfileImageView!
    @IBOutlet weak var ProfileImageView4: ProfileImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
