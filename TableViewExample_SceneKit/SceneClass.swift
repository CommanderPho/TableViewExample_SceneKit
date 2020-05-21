//
//  SceneKitTest.swift
//  TableViewExample_SceneKit
//
//  Created by Keitaro Takahashi on 12/1/15.
//  Copyright © 2015 Keitaro. All rights reserved.
//

import Foundation
import SceneKit

class SceneClass:SCNView{
    
	var ad:AppDelegate = NSApplication.shared.delegate as! AppDelegate
    
	override func mouseDown(with event: NSEvent) {
        // check what nodes are clicked
		let p = self.convert(event.locationInWindow, from: nil)
        
        Swift.print("(x,y) = \(p.x),\(p.y)")
        
        
        let hitResults = self.hitTest(p,options:nil)
        
        
        if hitResults.count>0{
            let result:AnyObject = hitResults[0]
            
            let material = result.node!.geometry!.firstMaterial!
            let name = material.name
            let initialColor = material.emission.contents

            Swift.print("selected item : name \(name)")
            // ======= highlight it!
            SCNTransaction.begin()
			SCNTransaction.animationDuration = 0.5
            
            //on completion
			SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                material.emission.contents = initialColor
                SCNTransaction.commit()
            }
            
            
            material.emission.contents = NSColor.red
            SCNTransaction.commit()
            
            
        }
        
        
        
		super.mouseDown(with: event)
        
    }
    
	override func mouseMoved(with event: NSEvent) {
   
		super.mouseMoved(with: event)
    }
    
    
    
    
}
