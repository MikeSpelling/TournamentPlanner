//
//  Game.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Game: CustomStringConvertible {
    
    let scores: [Score]
    
    
    init(withScores scores: [Score]) {
        self.scores = scores
    }
    
    init(withTeams teams: [Team]) {
        var scores : [Score] = []
        for team in teams {
            scores.append(Score(withTeam: team, points: 0))
        }
        self.scores = scores
    }
    
    func includes(player: Player) -> Bool {
        for score in scores {
            if score.team.players.contains(player) {
                return true
            }
        }
        return false
    }
    
    func points(forPlayer player: Player) -> UInt {
        var points: UInt = 0
        for score in scores {
            points += score.points(forPlayer: player)
        }
        return points
    }
    
    // Mark: - CustomStringConvertible
    
    public var description:String {
        var string = ""
        for score in scores {
            string += "\(score)"
            if scores.index(of: score)! < scores.count-1 {
                string += " - "
            }
        }
        return string
    }
    
}
