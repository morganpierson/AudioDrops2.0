//
//  Node_Extensions.swift
//  AudioDrops2.0
//
//  Created by Morgan Pierson on 9/7/18.
//  Copyright © 2018 Morgan Pierson. All rights reserved.
//

import Foundation
import SceneKit

extension SCNNode {
    public class func allNodes(from file: String) -> [SCNNode] {
        var nodesInFile = [SCNNode]()
        
        do {
            guard let sceneURL = Bundle.main.url(forResource: file, withExtension: nil) else {
                print("Could not find scene file \(file)")
                
                return nodesInFile
            }
            
            let objScene = try SCNScene(url: sceneURL, options: [SCNSceneSource.LoadingOption.animationImportPolicy: SCNSceneSource.AnimationImportPolicy.doNotPlay])
            
            objScene.rootNode.enumerateChildNodes({ (node, _) in
                nodesInFile.append(node)
            })
        } catch {}
        return nodesInFile
    }
    
    //looks for first node in hitTest array of nodes
    func topmost(parent: SCNNode? = nil, until: SCNNode) -> SCNNode {
        if let pNode = self.parent {
            return pNode == until ? self : pNode.topmost(parent: pNode, until: until)
        } else {
            return self
        }
    }
}
