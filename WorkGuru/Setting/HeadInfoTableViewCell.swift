//
//  HeadInfoTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/3/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class HeadInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    
    
    
//    var imageURL:String?{
//        didSet{
//            profileImage.image =
//        }
//    }
    var name:String?{
        didSet{
            nameLabel.text = name?.uppercased()
        }
    }
    
    var work:String?{
        didSet{
            workLabel.text = work
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.masksToBounds = true
        self.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0)
    }

    func gradientBackground() {
        let colorTop =  UIColor.white.cgColor
        let colorBottom = UIColor(red:0.84, green:0.98, blue:0.95, alpha:1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [ 0.65, 0.95]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func dropShadow() {
//        let outerView = UIView(frame: profileImage.bounds)
//        outerView.clipsToBounds = false
//        outerView.layer.shadowColor = UIColor.black.cgColor
//        outerView.layer.shadowOpacity = 1
//        outerView.layer.shadowOffset = CGSize.zero
//        outerView.layer.shadowRadius = 10
//        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: profileImage.frame.width/2).cgPath
//        outerView.backgroundColor = UIColor.clear
//        profileImage.addSubview(outerView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
