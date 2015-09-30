//
//  CustomLabel.swift
//  TimeLine
//
//  Created by 片桐奏羽 on 2015/09/30.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */


    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1
    }
    
    override func drawTextInRect(rect: CGRect) {
        var insets = UIEdgeInsetsMake(1, 1, 1, 1)
        return super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
        
    }

}
