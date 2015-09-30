//
//  ViewController.swift
//  TimeLine
//
//  Created by 片桐奏羽 on 2015/09/30.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Tell {
    @IBOutlet weak var myTableView: UITableView!

    var list:[Record] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0...9 {
            list.append(Record.random())
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        
        var record = self.list[indexPath.row] as Record
        
        cell.update(record)
        

        
        return cell
    }
    
    func tell(a: NSString, feeling:Int) {
        if (a.length == 0) {
         return;
        }
        
        var r = Record()
        r.text = a as String;
        
        if (list.count == 0) {
            list.append(r)
        } else {
            list.insert(r, atIndex: 0);
        }
        self.myTableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mymodal") {
            var v = segue.destinationViewController as! ViewController2
            v.text = ""
            v.delegate = self
        }
    }
    
}

