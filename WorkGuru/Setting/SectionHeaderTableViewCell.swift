//
//  SectionHeaderTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/5/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String?{
        didSet{
            nameLabel.text = name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
