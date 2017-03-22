//
//  TournamentScorer.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 20/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class TournamentScorer: NSObject, NSCoding {
    
    let winValue: Int
    private let winValueCodingKey = "TournamentScorerWinValue"
    let loseValue: Int
    private let loseValueCodingKey = "TournamentScorerLoseValue"
    let drawValue: Int
    private let drawValueCodingKey = "TournamentScorerDrawValue"
    
    let winValueUsesPointDifference: Bool
    private let winValueUsesPointDifferenceCodingKey = "TournamentScorerWinValueUsesPointDifference"
    let loseValueUsesPointDifference: Bool
    private let loseValueUsesPointDifferenceCodingKey = "TournamentScorerLoseValueUsesPointDifference"
    
    init(winValue: Int = 1, loseValue: Int = 0, drawValue: Int = 0, winValueUsesPointDifference: Bool = false, loseValueUsesPointDifference: Bool = false) {
        self.winValue = winValue
        self.loseValue = loseValue
        self.drawValue = drawValue
        self.winValueUsesPointDifference = winValueUsesPointDifference
        self.loseValueUsesPointDifference = loseValueUsesPointDifference
    }
    
    func points(forPlayer player: Player, inGame game: Game) -> Int {
        return points(forTeam: game.team(forPlayer: player), inGame: game)
    }
    
    func points(forTeam team: Team?, inGame game: Game) -> Int {
        if (team == nil) {
            return 0
        }
        
        let winningTeam = game.winningTeam()
        let losingTeams = game.losingTeams()
        
        if team == winningTeam {
            if winValueUsesPointDifference {
                return game.score(forTeam: team!)!.value - game.score(forTeam: losingTeams[0])!.value
            }
            else {
                return winValue
            }
        }
        else if losingTeams.contains(team!) {
            if loseValueUsesPointDifference {
                return game.score(forTeam: team!)!.value - game.score(forTeam: winningTeam!)!.value
            }
            else {
                return loseValue
            }
        }
        else {
            return drawValue
        }
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(winValue, forKey: winValueCodingKey)
        aCoder.encode(loseValue, forKey: loseValueCodingKey)
        aCoder.encode(drawValue, forKey: drawValueCodingKey)
        
        aCoder.encode(winValueUsesPointDifference, forKey: winValueUsesPointDifferenceCodingKey)
        aCoder.encode(loseValueUsesPointDifference, forKey: loseValueUsesPointDifferenceCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        winValue = aDecoder.decodeInteger(forKey: winValueCodingKey)
        loseValue = aDecoder.decodeInteger(forKey: loseValueCodingKey)
        drawValue = aDecoder.decodeInteger(forKey: drawValueCodingKey)
        
        winValueUsesPointDifference = aDecoder.decodeBool(forKey: winValueUsesPointDifferenceCodingKey)
        loseValueUsesPointDifference = aDecoder.decodeBool(forKey: loseValueUsesPointDifferenceCodingKey)
    }
    
}
