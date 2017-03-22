//
//  Game.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Game: NSObject, NSCoding {
    
    var scores: [Score]
    private let scoresCodingKey = "GameScores"
    
    // MARK: - Initialization
    
    init(withScores scores: [Score]) {
        self.scores = scores
    }
    
    init(withTeams teams: [Team]) {
        var scores : [Score] = []
        for team in teams {
            scores.append(Score(withTeam: team, value: 0))
        }
        self.scores = scores
    }
    
    // MARK: - Helpers
    
    func team(forPlayer player: Player) -> Team? {
        return scores.first { (score: Score) -> Bool in
            return score.team.players.contains(player)
        }?.team
    }
    
    func score(forTeam team: Team) -> Score? {
        return scores.first { (score: Score) -> Bool in
            return score.team == team
        }
    }
    
    func teams() -> [Team] {
        return sortedScores().map { (score: Score) -> Team in
            return score.team
        }
    }
    
    func players() -> [Player] {
        return Array(teams().map { (team: Team) -> [Player] in
            return team.players
            }.joined())
    }
    
    func winningTeam() -> Team? {
        let sortedScores = self.sortedScores()
        var winningScore: Score? = sortedScores.first
        if sortedScores.count>1 {
            if sortedScores[0].value == sortedScores[1].value {
                winningScore = nil // draw
            }
        }
        return winningScore?.team
    }
    
    func losingTeams() -> [Team] {
        var teams: [Team] = []
        let winningTeam = self.winningTeam()
        
        if winningTeam != nil {
            teams = self.teams()
            teams.remove(at: 0)
        }
        return teams
    }
    
    // MARK: - Private
    
    private func sortedScores() -> [Score] {
        return scores.sorted { (score1: Score, score2: Score) -> Bool in
            return score1.value > score2.value
        }
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(scores, forKey: scoresCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        scores = aDecoder.decodeObject(forKey: scoresCodingKey) as! [Score]
    }
    
    // MARK: - NSObject
    
    override public var description:String {
        var string = ""
        for score in scores {
            string += "\(score)"
            if scores.index(of: score)! < scores.count-1 {
                string += " "
            }
        }
        return string
    }
    
}
