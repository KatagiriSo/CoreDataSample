//
//  Record.swift
//  TimeLine
//
//  Created by 片桐奏羽 on 2015/09/30.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import Foundation

extension Array
{
    func random()->T
    {
        
        let count = self.count
        let l = arc4random_uniform(UInt32(count))
        return self[Int(l)]
    }
}




class Record: NSObject {
    var date = NSDate()
    var text = ""
    var feeling = 0;
    
    func save()
    {
        
    }
    
    static func random()->Record
    {
        var record = Record()
        var ts = ["寝てた。","眠い","歩いてる","ごはん","仕事","テレビ","ネット"];
        record.text = ts.random()
        
        return record
    }
    
}

class RecordUtil {
    static func HMS(date:NSDate)->(String)
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.stringFromDate(date)
    }
}