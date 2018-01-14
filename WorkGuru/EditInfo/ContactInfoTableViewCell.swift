//
//  ContactInfoTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/9/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var name:String?{
        didSet{
            nameLabel.text = name
        }
    }
    var mail:String?{
        didSet{
            mailLabel.text = mail
        }
    }
    var phone:String?{
        didSet{
            phoneLabel.text = phone
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
