//
//  gameSystem.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 19/8/21.
//

import Foundation

class GameSystem {
    private let computer = Computer()
    private(set) var playerScore = 0
    private(set) var computerScore = 0
    static let instance = GameSystem()

    private init (){}
    
    // Back to the front end of the computer choosing
    func getComputerChoose() -> GameGestures {
        return computer.selectOption()
    }
    
    // check whether have whiner
    func haveWiner() -> Bool{
        if playerScore == 3 {
            return true
        }else if computerScore == 3{
            return true
        }
        return false
    }
    
    // determine whether player is win
    func isPlayerWin() -> Bool {
        if playerScore == 3 {
            return true
        }
        return false
    }
    
    // Get a round of results
    func compare(playerChoose:GameGestures, computerChoose:GameGestures){
        switch playerChoose {
        case .Paper:
            switch computerChoose {
            case .Paper: break
            case .Rock:
                playerScore += 1
            case .Scissor:
                computerScore += 1
            }
        case .Rock:
            switch computerChoose {
            case .Paper:
                computerScore += 1
            case .Rock: break;
            case .Scissor:
                playerScore += 1
            }
        case .Scissor:
            switch computerChoose {
            case .Paper:
                playerScore += 1
            case .Rock:
                computerScore += 1
            case .Scissor: break
            }
        }
    }
    
}
