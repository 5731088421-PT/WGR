//
//  UploadInfoTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/9/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class UploadInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func scanPress(_ sender: Any) {
        
    }
    @IBAction func uploadPress(_ sender: Any) {
        
    }
    
    var name:String?{
        didSet{
            nameLabel.text = name
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
