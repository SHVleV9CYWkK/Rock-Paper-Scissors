//
//  ViewController+ARAnchorPlacement.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 26/8/21.
//

import ARKit

import Foundation
extension ViewController: ARCoachingOverlayViewDelegate {
    func presentCoachingOverlay() {
        UIApplication.shared.isIdleTimerDisabled = true
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        coachingOverlay.goal = .horizontalPlane
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        promptInformation.isHidden = false
    }
    
    func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView){
        promptInformation.isHidden = true
    }
}
