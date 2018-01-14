//
//  HeadInfoTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/3/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class SelectInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    
    var name:String?{
        didSet{
            nameLabel.text = name
        }
    }
    
    var select:String?{
        didSet{
            selectedLabel.text = select
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
