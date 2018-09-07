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
    }
}







