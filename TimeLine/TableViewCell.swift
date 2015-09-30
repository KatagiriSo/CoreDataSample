//
//  TableViewCell.swift
//  TimeLine
//
//  Created by 片桐奏羽 on 2015/09/30.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var subLabel: CustomLabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(record:Record)
    {

        self.mainLabel.text = record.text
        self.subLabel.text = RecordUtil.HMS(record.date)
        self.optionLabel.text = record.feeling.description
        
//        
        var c1 = UIColor(red: 127/255, green: 213/255, blue: 171/255, alpha: 1.0);//グリーン系
        var c2 = UIColor(red: 254/255, green: 204/255, blue: 90/255, alpha: 1.0);//黄色系
        var c3 = UIColor(red: 230/255, green: 13/255, blue: 68/255, alpha: 1.0);//赤系
        
        var cs = [c1,c2,c3]
        
        self.backgroundColor = cs.random()
    }
    
}
