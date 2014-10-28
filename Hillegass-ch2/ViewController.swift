//
//  ViewController.swift
//  Hillegass-ch2
//
//  Created by 野村修 on 2014/10/27.
//  Copyright (c) 2014年 ofellabuta. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.stringValue = ""
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func seed(sender: AnyObject) {
        var tm : time_t = 0
        srandom(UInt32(time(&tm)))
        textField.stringValue = "Generator seeded"
    }
    
    @IBAction func generate(sender: AnyObject) {
        let generated = (random() % 100) + 1
        NSLog("generated = \(generated)")
        textField.integerValue = generated
    }
    
    @IBAction func generate2(sender: AnyObject) {
        let generated = arc4random_uniform(100) + 1
        NSLog("generated = \(generated)")
        textField.integerValue = Int(generated)
    }
}

