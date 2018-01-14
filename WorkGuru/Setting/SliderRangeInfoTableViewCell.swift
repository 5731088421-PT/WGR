//
//  HeadInfoTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/3/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit
import MARKRangeSlider

class SliderRangeInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var rangeSlider: MARKRangeSlider!
    
    var sliderRangeValue:[CGFloat]?{
        didSet{
            rangeSlider.setMinValue(sliderRangeValue![0], maxValue: sliderRangeValue![1])
        }
    }
    
    var sliderValue:[CGFloat]?{
        didSet{
            rangeSlider.setLeftValue(sliderValue![0], rightValue: sliderValue![1])
            select = toString(from: sliderValue!)
        }
    }
    
    
    var delegate : changeInputDataDelegate?
    var indexPath : IndexPath?
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        rangeSlider.minimumDistance = 1
        rangeSlider.addTarget(self, action: #selector(rangeSliderWasChange(_:)), for: .valueChanged)
    }
    
    @objc func rangeSliderWasChange(_ slider:MARKRangeSlider) {
        let val = [String(format:"%.0f", rangeSlider.leftValue),
                   String(format:"%.0f", rangeSlider.rightValue)]
        select = toString(from: [rangeSlider.leftValue,rangeSlider.rightValue])
        delegate?.changeSelectedTo(value: val, at: indexPath!, reloadCell: false)
    }
    
    private func toString(from value: [CGFloat]) -> String{
        let val = [String(format:"%.0f", value[0]),
                   String(format:"%.0f", value[1])]
        return val[0] + "-" + val[1]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
