//
//  SceneObject.swift
//  AudioDrops2.0
//
//  Created by Morgan Pierson on 9/7/18.
//  Copyright © 2018 Morgan Pierson. All rights reserved.
//

import Foundation
import SceneKit

//TO BE USED WHEN WE START EXTRACTING ARTIST OBJECTS FROM API!!!
class SceneObject: SCNNode {
//    init(from file: String?) {
//        super.init()
//        guard let scene = self.scene else { return }
//        
//        let dropNode = SCNNode(geometry: SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.02))
//        dropNode.geometry?.firstMaterial?.diffuse.contents = UIColor.black
//        
//        dropNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "drop")
//        
//        dropNode.geometry?.firstMaterial?.specular.contents = UIColor.white
//        
//        let containerNode = SCNNode()
//        
//        containerNode.addChildNode(dropNode)
//        
//        containerNode.position = position
//        scene.rootNode.addChildNode(containerNode)
//        nodeAnimation(node: containerNode)
//    }
//    
//    func nodeAnimation(node: SCNNode) {
//        
//        let rotation = SCNAction.rotateBy(x: CGFloat(360.degreesToRadians), y: CGFloat(360.degreesToRadians), z: CGFloat(360.degreesToRadians), duration: 7)
//        let bounceDown = SCNAction.moveBy(x: 0, y: -0.12, z: 0, duration: 1.7)
//        let bounceUp = SCNAction.moveBy(x: 0, y: 0.12, z: 0, duration: 1.7)
//        let bounceSequence = SCNAction.sequence([bounceDown, bounceUp])
//        let foreverBounce = SCNAction.repeatForever(bounceSequence)
//        let foreverRotate = SCNAction.repeatForever(rotation)
//        
//        node.runAction(foreverBounce)
//        node.runAction(foreverRotate)
//    }
}
