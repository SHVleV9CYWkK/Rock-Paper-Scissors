//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 4/8/21.
//

import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController, ARCoachingOverlayViewDelegate {
    
    @IBOutlet weak var arView: ARView!
    
    @IBOutlet weak var scissor: UIButton!
    
    @IBOutlet weak var paper: UIButton!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var rock: UIButton!
    
    @IBOutlet weak var coachingOverlay: ARCoachingOverlayView!
    
    private let box = try! Experience.loadBox();
    
    private let system = gameSystem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let arConfiguration = ARWorldTrackingConfiguration()
        arConfiguration.planeDetection = .horizontal
        arView.session.run(arConfiguration)
        presentCoachingOverlay()
    }
    
    
    
    @IBAction func paperButtonAction(_ sender: Any) {
        print("Player: Paper")
        box.notifications.hide.post()
        box.notifications.paperUser.post()
        checkComputerDetermine()
    }
    
    @IBAction func scissorButtonAction(_ sender: Any) {
        print("Player: Scissor")
        box.notifications.hide.post()
        box.notifications.scissorsUser.post()
        checkComputerDetermine()
    }
    
    @IBAction func rockButtonAction(_ sender: Any) {
        print("Player: Rock")
        box.notifications.hide.post()
        box.notifications.rockUser.post()
        checkComputerDetermine()
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let tapLocation: CGPoint = sender.location(in: arView)
        let estimatedPlane: ARRaycastQuery.Target = .estimatedPlane
        let alignment: ARRaycastQuery.TargetAlignment = .horizontal
                        
        let result: [ARRaycastResult] = arView.raycast(from: tapLocation,
                                                           allowing: estimatedPlane,
                                                          alignment: alignment)
                
        guard let rayCast: ARRaycastResult = result.first
        else { return }
                
        let anchor = AnchorEntity(world: rayCast.worldTransform)
        anchor.addChild(box)
        arView.scene.anchors.append(anchor)
        print(rayCast)
        
        showChooseButton()
        tapGesture.isEnabled = false
    }
    
    
    func presentCoachingOverlay() {
        UIApplication.shared.isIdleTimerDisabled = true
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        coachingOverlay.goal = .horizontalPlane
    }
    
    func checkComputerDetermine(){
        let computChoose =  system.getComputerChoose()
        switch computChoose {
            case .Paper:
                box.notifications.paperCpu.post()
            case .Rock:
                box.notifications.rockCpu.post()
            case .Scissor:
                box.notifications.scissorsCpu.post()
        }
    }
    
    func hiddenChooseButton(){
        scissor.isHidden = true;
        paper.isHidden = true;
        rock.isHidden = true;
    }
    
    func showChooseButton(){
        paper.isHidden = false
        rock.isHidden = false
        scissor.isHidden = false
    }
}
