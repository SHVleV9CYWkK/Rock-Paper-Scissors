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
    
    @IBOutlet weak var promptInformation: UILabel!
    
    @IBOutlet weak var chooseColumn: UIStackView!
    
    @IBOutlet weak var scissor: UIButton!
    
    @IBOutlet weak var paper: UIButton!
    
    @IBOutlet weak var scoreColumn: UIStackView!
    
    @IBOutlet weak var playerScoreLable: UILabel!
    
    @IBOutlet weak var computerScoreLable: UILabel!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var rock: UIButton!
    
    @IBOutlet weak var coachingOverlay: ARCoachingOverlayView!
    
    private let box = try! Experience.loadBox();
    
    private let system = GameSystem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let arConfiguration = ARWorldTrackingConfiguration()
        arConfiguration.planeDetection = .horizontal
        arView.session.run(arConfiguration)
        presentCoachingOverlay()
        promptInformation.isHidden = false
    }
    
    @IBAction func paperButtonAction(_ sender: Any) {
        print("Player: Paper")
        chooseColumn.isHidden = true
        box.notifications.hide.post()
        box.notifications.paperUser.post()
        box.actions.completeARound.onAction = actionCompleted(_:)
        let computerChoose = checkComputerDetermine()
        system.compare(playerChoose: .Paper, computerChoose: computerChoose)
    }
    
    @IBAction func scissorButtonAction(_ sender: Any) {
        print("Player: Scissor")
        chooseColumn.isHidden = true
        box.notifications.hide.post()
        box.notifications.scissorsUser.post()
        box.actions.completeARound.onAction = actionCompleted(_:)
        let computerChoose = checkComputerDetermine()
        system.compare(playerChoose: .Scissor, computerChoose: computerChoose)
    }
    
    @IBAction func rockButtonAction(_ sender: Any) {
        print("Player: Rock")
        chooseColumn.isHidden = true
        box.notifications.hide.post()
        box.notifications.rockUser.post()
        box.actions.completeARound.onAction = actionCompleted(_:)
        let computerChoose = checkComputerDetermine()
        system.compare(playerChoose: .Scissor, computerChoose: computerChoose)
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        promptInformation.isHidden = true
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
        
        chooseColumn.isHidden = false
        scoreColumn.isHidden = false
        box.notifications.showQuestionMark.post()
        tapGesture.isEnabled = false
    }
    
    
    func presentCoachingOverlay() {
        UIApplication.shared.isIdleTimerDisabled = true
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        coachingOverlay.goal = .horizontalPlane
    }
    
    func checkComputerDetermine() -> GameGestures{
        let computChoose =  system.getComputerChoose()
        switch computChoose {
            case .Paper:
                print("Computer: Paper\n")
                box.notifications.paperCpu.post()
            case .Rock:
                print("Computer: Rock\n")
                box.notifications.rockCpu.post()
            case .Scissor:
                print("Computer: Scissor\n")
                box.notifications.scissorsCpu.post()
        }
        return computChoose
    }
   
    func updataScoreDisplay(){
        playerScoreLable.text = String(system.playerScore)
        computerScoreLable.text = String(system.computerScore)
    }
    
    func prepareNextContent(){
        updataScoreDisplay()
        if system.haveWiner(){
            if system.isPlayerWin(){
                
            }
        }else{
            chooseColumn.isHidden = false
        }
    }
    
    func actionCompleted(_ entity: Entity?) {
        guard entity != nil else { return }
        prepareNextContent()
        print("执行了完毕")
    }
}
