//
//  DropScene.swift
//  AudioDrops2.0
//
//  Created by Morgan Pierson on 9/7/18.
//  Copyright © 2018 Morgan Pierson. All rights reserved.
//

import Foundation
import SceneKit

struct DropScene {
    var scene: SCNScene?
    var animating: Bool = false
    
    init() {
        scene = self.initializeScene()
        
    }
    
    func initializeScene() -> SCNScene? {
        let scene = SCNScene()
        
        setDefaults(scene: scene)
        
        return scene
    }
    
    func setDefaults(scene: SCNScene) {
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = SCNLight.LightType.ambient
        ambientLightNode.light?.color = UIColor(white: 0.6, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        let directionalLight = SCNLight()
        directionalLight.type = .directional
        let directionalNode = SCNNode()
        directionalNode.eulerAngles = SCNVector3Make(GLKMathDegreesToRadians(-130), GLKMathDegreesToRadians(0), GLKMathDegreesToRadians(35))
        directionalNode.light = directionalLight
        scene.rootNode.addChildNode(directionalNode)
    }
    
    func addNode(position: SCNVector3) {
        guard let scene = self.scene else { return }
        
        let dropNode = SCNNode(geometry: SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.02))
        dropNode.geometry?.firstMaterial?.diffuse.contents = UIColor.black

        dropNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "drop")

        dropNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        let containerNode = SCNNode()
        
        containerNode.addChildNode(dropNode)
        
        containerNode.position = position
        scene.rootNode.addChildNode(containerNode)
        nodeAnimation(node: containerNode)
    }
    
    func nodeAnimation(node: SCNNode) {
        
        let rotation = SCNAction.rotateBy(x: CGFloat(360.degreesToRadians), y: CGFloat(360.degreesToRadians), z: CGFloat(360.degreesToRadians), duration: 7)
        let bounceDown = SCNAction.moveBy(x: 0, y: -0.12, z: 0, duration: 1.7)
        let bounceUp = SCNAction.moveBy(x: 0, y: 0.12, z: 0, duration: 1.7)
        let bounceSequence = SCNAction.sequence([bounceDown, bounceUp])
        let foreverBounce = SCNAction.repeatForever(bounceSequence)
        let foreverRotate = SCNAction.repeatForever(rotation)
        
        node.runAction(foreverBounce)
        node.runAction(foreverRotate)
    }
    
    mutating func tapAnimation(node: SCNNode) {
        if animating { return }
        
        animating = true
        let rotation1 = SCNAction.rotateBy(x: CGFloat(-90.degreesToRadians), y: CGFloat(-90.degreesToRadians), z: CGFloat(-90.degreesToRadians), duration: 1)
        node.runAction(rotation1)
        let rotation2 = SCNAction.rotateBy(x: CGFloat(360.degreesToRadians), y: CGFloat(360.degreesToRadians), z: CGFloat(360.degreesToRadians), duration: 1)
        let rotateAnimation = SCNAction.repeat(rotation2, count: 2)
        node.runAction(rotateAnimation)
        animating = false
    }
}

extension Int {
    var degreesToRadians: Double {
        return Double(self) * .pi/180
    }
}





