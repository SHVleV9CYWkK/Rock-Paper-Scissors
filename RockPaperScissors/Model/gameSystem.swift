//
//  gameSystem.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 19/8/21.
//

import Foundation

class gameSystem {
    private let computer = Computer()
    let playerScore = 0
    let computerScore = 0

    func getComputerChoose() -> gameGestures {
        return computer.selectOption()
    }
    
    func haveWiner() -> Bool {
        if playerScore == 3 {
            return true
        }else if computerScore == 3{
            return true
        }
        return false
    }
    
    
}


