
//
//  SceneKitTest.swift
//  TableViewExample_SceneKit
//
//  Created by Keitaro Takahashi on 12/1/15.
//  Copyright © 2015 Keitaro. All rights reserved.
//

import Cocoa
import SceneKit

class tableViewController: NSViewController {
    
    var ad:AppDelegate = NSApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var myTableView: NSTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
		let nib = NSNib(nibNamed: NSNib.Name(rawValue: "listCell"), bundle: Bundle.main)
		myTableView.register(nib!, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: "listCell"))
        print("tableView load nib done")

        
    }
    
    struct t_data{
        var label:String
        var sceneView:SCNScene
    }
    
    var dataStr:[t_data] = []
    
    func setupTable(){

        for i in 0..<10{
            var scene = SCNScene()
            let TScene = DrawObjectClass(w:600,h:200)
        
			TScene.drawSphere(scene: &scene)
        
            self.dataStr.append(t_data(label: "cell_"+i.description, sceneView: scene))
            //ad.TargetNMFVectorView.append(SceneClass())
        }
        
        print("setup done : data count = \(self.dataStr.count)")
    }
    
    
}

extension tableViewController: NSTableViewDataSource, NSTableViewDelegate {
    
	func numberOfRows(in tableView: NSTableView) -> Int {
		return self.dataStr.count
	}
    
	func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 150
    }

    
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        print("tableVIew(\(row))")
        
		let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "listCell"), owner: self) as! listCell
        let item:t_data = self.dataStr[row]
        
        cell.label.stringValue = item.label
        
        let x = CGFloat(arc4random()%100) / 100.0
        let y = CGFloat(arc4random()%100) / 100.0
        let z = CGFloat(arc4random()%100) / 100.0
        
        
        cell.myView.scene = item.sceneView
        cell.myView.backgroundColor = NSColor(red: x, green: y, blue: z, alpha: 1.0)
        cell.myView.autoenablesDefaultLighting = true
        //cell.myView.allowsCameraControl = false
       // cell.myView.showsStatistics = true
        
        //ad.TargetNMFVectorView.append(cell.myView)
        
        print("tableDone")

        return cell
    }
}

