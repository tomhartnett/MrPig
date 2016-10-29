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
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override var shouldAutorotate: Bool { return false }
    
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
        
    }
    
    func setupActions() {
        
    }
    
    func setupTraffic() {
        
    }
    
    func setupGestures() {
        
    }
    
    func setupSounds() {
        
    }
}

