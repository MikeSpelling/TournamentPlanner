//
//  Game.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Game: NSObject, NSCoding {
    
    private let identifier: String
    private let identifierCodingKey = "GameIdentifier"
    
    var scores: [Score]
    private let scoresCodingKey = "GameScores"
    
    var date: Date?
    private let dateCodingKey = "GameDate"
    
    // MARK: - Initialization
    
    init(withScores scores: [Score], date: Date? = nil) {
        self.identifier = UUID().uuidString
        self.scores = scores
        self.date = date
    }
    
    init(withTeams teams: [Team], date: Date? = nil) {
        self.identifier = UUID().uuidString
        var scores : [Score] = []
        for team in teams {
            scores.append(Score(withTeam: team))
        }
        self.scores = scores
        self.date = date
    }
    
    // MARK: - Helpers
    
    func team(forPlayer player: Player?) -> Team? {
        if player != nil {
            return scores.first { (score: Score) -> Bool in
                return score.team.players.contains(player!)
            }?.team
        }
        return nil
    }
    
    func score(forTeam team: Team?) -> Score? {
        if team != nil {
            return scores.first { (score: Score) -> Bool in
                return score.team == team!
            }
        }
        return nil
    }
    
    func teams() -> [Team] {
        return Score.sort(scores).map { (score: Score) -> Team in
            return score.team
        }
    }
    
    func players() -> [Player] {
        return Array(teams().map { (team: Team) -> [Player] in
            return team.players
            }.joined())
    }
    
    func winningScores() -> [Score] {
        var winningScores = [Score]()
        let sortedScores = Score.sort(scores)
        for score in sortedScores {
            if winningScores.count == 0 {
                winningScores.append(score)
            }
            else if score.value == winningScores.first!.value {
                winningScores.append(score)
            }
        }
        return winningScores.count == sortedScores.count ? [Score]() : winningScores
    }
    
    func losingScores() -> [Score] {
        var losingScores = Score.sort(scores)
        losingScores.removeFirst(winningScores().count)
        return scores.count == losingScores.count ? [Score]() : losingScores
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(identifier, forKey: identifierCodingKey)
        aCoder.encode(scores, forKey: scoresCodingKey)
        aCoder.encode(date, forKey: dateCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        identifier = aDecoder.decodeObject(forKey: identifierCodingKey) as! String
        scores = aDecoder.decodeObject(forKey: scoresCodingKey) as! [Score]
        date = aDecoder.decodeObject(forKey: dateCodingKey) as? Date
    }
    
    // MARK: - NSObject
    
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Game {
            return identifier == other.identifier
        }
        return false
    }
    
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
