//
//  Team.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Team: Equatable, CustomStringConvertible {
    
    let players: [Player]
    
    init(withPlayers players:[Player]) {
        self.players = players
    }
    
    func canPlay(team: Team) -> Bool {
        for player in players {
            if team.players.contains(player) {
                return false
            }
        }
        return true
    }
    
    // Mark: - Equatable
    
    public static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs.players == rhs.players
    }
    
    // Mark: - CustomStringConvertible
    
    public var description:String {
        var string = "("
        for player in players {
            string += player.name
            if players.index(of: player)! < players.count-1 {
                string += ","
            }
        }
        return string + ")"
    }
    
}
