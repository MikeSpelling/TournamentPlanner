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
    
    func points(forPlayer player: Player?, inGame game: Game?) -> Int {
        return points(forTeam: game?.team(forPlayer: player), inGame: game)
    }
    
    func points(forTeam team: Team?, inGame game: Game?) -> Int {
        if (team == nil || game == nil) {
            return 0
        }
        
        let winningScores = game!.winningScores()
        let losingScores = game!.losingScores()
        
        if winningScores.count>0 && losingScores.count>0 {
            let didTeamWin = winningScores.map({ (score: Score) -> Team in
                return score.team
            }).contains(team!)
            
            if didTeamWin {
                if winValueUsesPointDifference {
                    return winningScores.first!.value - losingScores.first!.value
                } else {
                    return winValue
                }
            }
            else {
                if loseValueUsesPointDifference {
                    return game!.score(forTeam: team)!.value - winningScores.first!.value
                } else {
                    return loseValue
                }
            }
        }
        return drawValue
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
