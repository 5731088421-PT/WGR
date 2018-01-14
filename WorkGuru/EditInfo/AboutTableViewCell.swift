//
//  AboutTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/9/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var textCountLabel: UILabel!
    
    var name:String?{
        didSet{
            nameLabel.text = name
        }
    }
    var detail:String?{
        didSet{
            detailLabel.text = detail
            textCountLabel.text = String(describing: detail?.count)
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
