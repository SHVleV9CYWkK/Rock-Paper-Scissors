//
//  Computer.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 11/8/21.
//

import Foundation
struct Computer {
    func selectOption() -> GameGestures {
        let random = Int8(arc4random_uniform(3))
        var result:GameGestures = .Rock
        switch random {
        case 2:
            result =  .Rock
        case 1:
            result = .Scissor
        case 0:
            result = .Paper
        default: break;
        }
        return result
    }
}
