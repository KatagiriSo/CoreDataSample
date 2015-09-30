//
//  ViewController2.swift
//  TimeLine
//
//  Created by 片桐奏羽 on 2015/09/30.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

protocol Tell {
    func tell(message:NSString, feeling:Int)->()
}

class ViewController2: UIViewController {
    
    var delegate : Tell?
    @IBOutlet weak var textView: UITextView!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.textView.text = text
        self.textView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        println("p")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    @IBAction func tweetButtonPushed(sender: AnyObject) {
        
        var v = sender as! UIView
        
        if (self.delegate != nil) {
            self.delegate?.tell(self.textView.text, feeling: v.tag)
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
