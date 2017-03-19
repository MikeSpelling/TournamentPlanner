//
//  Score.swift
//  DoublesScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Score: Equatable, CustomStringConvertible {
    let team: Team
    let points: UInt
    
    init(withTeam team: Team, points: UInt) {
        self.team = team
        self.points = points
    }
    
    func points(forPlayer player: Player) -> UInt {
        if team.players.contains(player) {
            return points
        }
        return 0
    }
    
    // Mark: - Equatable
    
    public static func ==(lhs: Score, rhs: Score) -> Bool {
        return lhs.team == rhs.team && lhs.points == rhs.points
    }
    
    // Mark: - CustomStringConvertible
    
    public var description:String {
        return "\(team): \(points)"
    }
}
