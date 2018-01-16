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
        let val = String(format:"%.0f", slider.value)
        delegate?.changeSelectedTo(values: [val], at: indexPath!, reloadCell: false)
        select = val
    }
    
    var name:String?{
        didSet{
            nameLabel.text = name
        }
    }
    
    private var select:String?{
        didSet{
            selectedLabel.text = select
        }
    }
    
    var sliderRangeValue:[Float]?{
        didSet{
            guard let value = sliderRangeValue else {
                return
            }
            slider.minimumValue = value[0]
            slider.maximumValue = value[1]
        }
    }
    
    var sliderValue:Float?{
        didSet{
            guard let value = sliderValue else {
                return
            }
            slider.setValue(value, animated: true)
            select = String(format:"%.0f", value)
        }
    }
    
    var delegate : changeInputDataDelegate?
    var indexPath : IndexPath?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb"), for: UIControlState.normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb"), for: UIControlState.highlighted)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
