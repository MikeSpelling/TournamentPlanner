//
//  Player.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Player: Equatable, CustomStringConvertible {
    
    let name: String
    
    init(withName name: String) {
        self.name = name
    }
    
    // Mark: - Equatable
    
    public static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
    
    // Mark: - CustomStringConvertible
    
    public var description:String {
        return name
    }
    
}
