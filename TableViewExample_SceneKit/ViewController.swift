//
//  SceneKitTest.swift
//  TableViewExample_SceneKit
//
//  Created by Keitaro Takahashi on 12/1/15.
//  Copyright © 2015 Keitaro. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
	var ad:AppDelegate = NSApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var myView2: NSView!
    @IBOutlet weak var myView: NSView!
    
    var MVC:tableViewController!
    var SVC:ScrollViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		self.MVC = tableViewController(nibName:NSNib.Name(rawValue: "tableViewController"),bundle:nil)
        self.MVC.view.frame  = self.myView.bounds
        
        self.MVC.setupTable()
        self.MVC.myTableView.reloadData()
        
        self.myView.addSubview(self.MVC.view)


    }

    @IBAction func reloadAction(sender: AnyObject) {
        
       self.MVC.myTableView.reloadData()
    }
	
    

}

