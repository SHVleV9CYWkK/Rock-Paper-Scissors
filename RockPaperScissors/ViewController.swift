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
    
    @IBOutlet weak var rock: UIButton!
    
    @IBOutlet weak var coachingOverlay: ARCoachingOverlayView!
    
    let box = try! Experience.loadBox();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scissor.isHidden = true;
        paper.isHidden = true;
        rock.isHidden = true;
        
        let arConfiguration = ARWorldTrackingConfiguration()
        arConfiguration.planeDetection = .horizontal
        arView.session.run(arConfiguration)
        presentCoachingOverlay()
    }
    
    
    
    @IBAction func paperButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func scissorButtonAction(_ sender: Any) {
    
    }
    
    @IBAction func rockButtonAction(_ sender: Any) {
    
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
        
        paper.isHidden = false;
        rock.isHidden = false;
        scissor.isHidden = false;
    }
    
    
    func presentCoachingOverlay() {
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.activatesAutomatically = false
        self.coachingOverlay.setActive(true, animated: true)
    }
}
