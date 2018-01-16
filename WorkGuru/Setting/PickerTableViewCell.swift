//
//  pickerTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/10/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell,UIPickerViewDelegate,UIPickerViewDataSource {

    var pickerData: [String]?{
        didSet{
            
        }
    }
    
    var delegate:changeInputDataDelegate?
    var parentIndexPath:IndexPath?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData?[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.delegate?.changeSelectedTo(values: [pickerData![row]], at: parentIndexPath!, reloadCell: true)
    }
    
    @IBOutlet weak var Picker: UIPickerView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Picker.dataSource = self
        Picker.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
