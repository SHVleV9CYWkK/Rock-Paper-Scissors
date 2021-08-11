//
//  Computer.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 11/8/21.
//

import Foundation
class Computer {
    
    func selectOption() -> Int8 {
        return Int8(arc4random_uniform(3))
    }
}
