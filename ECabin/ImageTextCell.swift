//
//  ImageTextCell.swift
//  LineLayout
//
//  Created by wl on 15/11/6.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit
import FSPagerView
class ImageTextCell: FSPagerViewCell {
    
    var imageview: UIImageView?
    var imageStr: NSString? {
    
        didSet {
            self.imageview!.image = UIImage(named: self.imageStr! as String)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageview = UIImageView()
        self.addSubview(self.imageview!)        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageview?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
