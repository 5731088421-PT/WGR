//
//  TextViewTableViewCell.swift
//  WorkGuru
//
//  Created by Panupong on 1/10/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var textData:String?{
        didSet{
            if textData!.count > 0{
                textView.text = textData!
                textView.textColor = UIColor.black
                textCount = textData!.count
            }
            else{
                textView.text = "Enter text here."
                textView.textColor = UIColor.lightGray
                textCount = 0
            }
            
        }
    }
    
    var textCount:Int?{
        didSet{
            if textCount! < 400{
                countLabel.textColor = UIColor.darkGray
            }
            else if textCount! <= 499{
                countLabel.textColor = UIColor.orange
            }
            else{
                countLabel.textColor = UIColor.red
            }
            countLabel.text = String(textCount ?? 0) + "/" + "500"
        }
    }
    
    var delegate: changeInputDataDelegate?
    var editDelegate: beginEditSelectedViewDelegate?
    var parentIndexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
        textView.returnKeyType = UIReturnKeyType.done
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.clipsToBounds = true
        textCount = textView.text.count
        // Initialization code
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        editDelegate?.selectForEditing(From: parentIndexPath!)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.changeSelectedTo(value: [textView.text], at: parentIndexPath!, reloadCell: true)
        if textView.text.isEmpty {
            textData = ""
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            
            return false
        }
        if textView.text.count + text.count > 500 {
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textCount = textView.text.count
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
