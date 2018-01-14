//
//  HeadInfoTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/3/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class SliderInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderChange(_ sender: Any) {
    }
    
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
    
    var sliderValue:Float?{
        didSet{
            guard let value = sliderValue else {
                return
            }
            slider.setValue(value, animated: true)
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
