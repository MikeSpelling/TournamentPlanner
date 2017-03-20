//
//  Score.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Score: Equatable, CustomStringConvertible {
    let team: Team
    let value: Int
    
    init(withTeam team: Team, value: Int) {
        self.team = team
        self.value = value
    }
    
    func value(forPlayer player: Player) -> Int {
        if team.players.contains(player) {
            return value
        }
        return 0
    }
    
    // MARK: - Equatable
    
    public static func ==(lhs: Score, rhs: Score) -> Bool {
        return lhs.team == rhs.team && lhs.value == rhs.value
    }
    
    // MARK: - CustomStringConvertible
    
    public var description:String {
        return "\(team):\(value)"
    }
}
