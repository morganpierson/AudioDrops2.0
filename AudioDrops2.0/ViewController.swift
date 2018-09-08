//
//  ViewController.swift
//  AudioDrops2.0
//
//  Created by Morgan Pierson on 9/7/18.
//  Copyright © 2018 Morgan Pierson. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var sceneController = DropScene()
    var didInitializeScene: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTapScreen))
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        //Create a new scene
        if let scene = sceneController.scene {
            sceneView.scene = scene
        }
        
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
    @objc func didTapScreen(recognizer: UITapGestureRecognizer) {
        if didInitializeScene, let camera = sceneView.session.currentFrame?.camera {
            let tapLocation = recognizer.location(in: sceneView)
            let hitTestResults = sceneView.hitTest(tapLocation)
            if let node = hitTestResults.first?.node, let scene = sceneController.scene, let dropNode = node.topmost(until: scene.rootNode) as? SCNNode {
                sceneController.tapAnimation(node: dropNode)
            } else {
                var translation = matrix_identity_float4x4
                translation.columns.3.z = -1.0
                let transform = camera.transform * translation
                let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
                sceneController.addNode(position: position)
            }
            
//            if let camera = sceneView.session.currentFrame?.camera {
//                var translation = matrix_identity_float4x4
//                translation.columns.3.z = -1.0
//                let transform = camera.transform * translation
//                let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
//                sceneController.addNode(position: position)
//            }
        }
    }
    
    //Check to see if scene has been initialized for user interaction
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if !didInitializeScene {
            if sceneView.session.currentFrame?.camera != nil{
                didInitializeScene = true
//                didInitializeScene = true
//                var translation = matrix_identity_float4x4
//
//                //allow user to place object 1 meter in front of camera
//                translation.columns.3.z = -1.0
//                let transform = camera.transform * translation
//                let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
//                sceneController.addNode(position: position)
            }
        }
    }
    
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
