//
//  ProfileImageView.swift
//  WorkGuru
//
//  Created by Panupong on 1/5/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

@IBDesignable

class ProfileImageView: UIView {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func removePress(_ sender: Any) {
        removeButton.isHidden = true
        addButton.isHidden = false
    }
    @IBAction func addPress(_ sender: Any) {
        removeButton.isHidden = false
        addButton.isHidden = true
    }
    
    var contentView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = layer.bounds.width/9
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView.frame = bounds
        
        // Make the view stretch with containing view
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
