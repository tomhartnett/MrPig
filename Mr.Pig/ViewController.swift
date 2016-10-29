//
//  ViewController.swift
//  Mr.Pig
//
//  Created by Tom Hartnett on 10/26/16.
//  Copyright © 2016 Sleekible LLC. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class ViewController: UIViewController {

    let game = GameHelper.sharedInstance
    var scnView: SCNView!
    var gameScene: SCNScene!
    var splashScene: SCNScene!
    var pigNode: SCNNode!
    var cameraNode: SCNNode!
    var cameraFollowNode: SCNNode!
    var lightFollowNode: SCNNode!
    var trafficNode: SCNNode!
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override var shouldAutorotate: Bool { return false }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if game.state == .tapToPlay {
            
            startGame()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupScenes()
        setupNodes()
        setupActions()
        setupTraffic()
        setupGestures()
        setupSounds()
        
        game.state = .tapToPlay
    }
    
    func setupScenes() {
        
        scnView = SCNView(frame: self.view.frame)
        self.view.addSubview(scnView)
        
        gameScene = SCNScene(named: "/MrPig.scnassets/GameScene.scn")
        splashScene = SCNScene(named: "/MrPig.scnassets/SplashScene.scn")
        
        scnView.scene = splashScene
    }
    
    func setupNodes() {
    
        pigNode = gameScene.rootNode.childNode(withName: "MrPig", recursively: true)!
        cameraNode = gameScene.rootNode.childNode(withName: "camera", recursively: true)!
        cameraNode.addChildNode(game.hudNode)
        cameraFollowNode = gameScene.rootNode.childNode(withName: "FollowCamera", recursively: true)!
        lightFollowNode = gameScene.rootNode.childNode(withName: "FollowLight", recursively: true)!
        trafficNode = gameScene.rootNode.childNode(withName: "Traffic", recursively: true)!
    }
    
    func setupActions() {
        
    }
    
    func setupTraffic() {
        
    }
    
    func setupGestures() {
        
    }
    
    func setupSounds() {
        
    }
    
    func startGame() {
        
        splashScene.isPaused = true
        
        let transition = SKTransition.doorsOpenVertical(withDuration: 1.0)
        scnView.present(gameScene, with: transition, incomingPointOfView: nil, completionHandler: {
            
            self.game.state = .playing
            self.setupSounds()
            self.gameScene.isPaused = false
        })
    }
    
    func stopGame() {
        
        game.state = .gameOver
        game.reset()
    }
    
    func startSplash() {
        
        gameScene.isPaused = true
        
        let transition = SKTransition.doorsOpenVertical(withDuration: 1.0)
        scnView.present(splashScene, with: transition, incomingPointOfView: nil, completionHandler: {
            
            self.game.state = .tapToPlay
            self.setupSounds()
            self.splashScene.isPaused = false
        })
    }
}

