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
        gradientBackground()
        self.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func gradientBackground() {
        let colorTop =  UIColor.white.cgColor
        let colorBottom = UIColor(red:0.84, green:0.98, blue:0.95, alpha:1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [ 0.7, 0.95]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
