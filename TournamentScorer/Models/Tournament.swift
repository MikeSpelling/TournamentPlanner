//
//  Tournament.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Tournament: NSObject, NSCoding {
    
    let identifier: String
    private let identifierCodingKey = "TournamentIdentifier"
    
    var title: String = ""
    private let titleCodingKey = "TournamentTitle"
    
    var scorer: TournamentScorer = TournamentScorer(winValueUsesPointDifference: true)
    private let scorerCodingKey = "TournamentScorer"
    
    var players: [Player] = []
    private let playersCodingKey = "TournamentPlayers"
    
    var teams: [Team] = []
    private let teamsCodingKey = "TournamentTeams"
    
    var gamesPlayed: [Game] = []
    private let gamesPlayedCodingKey = "TournamentGamesPlayed"
    
    var gamesToPlay: [Game] = []
    private let gamesToPlayCodingKey = "TournamentGamesToPlay"
    
    
    init(withTitle title: String) {
        identifier = UUID().uuidString
        
        self.title = title
    }
    
    func leaderboard() -> [Score] {
        var scores = [Score]()
        for player in players {
            var points = 0
            for game in gamesPlayed(forPlayer: player) {
                points += scorer.points(forPlayer: player, inGame: game)
            }
            scores.append(Score(withTeam: Team(withPlayers: [player]), value: points))
        }
        return scores.sorted(by: { (score1, score2) -> Bool in
            if score1.value == score2.value {
                return score1.description.compare(score2.description) == ComparisonResult.orderedAscending
            }
            return score1.value > score2.value
        })
    }
    
    func points(forPlayer player: Player) -> Int {
        var points = 0
        for game in gamesPlayed(forPlayer: player) {
            points += scorer.points(forPlayer: player, inGame: game)
        }
        return points
    }
    
    func points(forTeam team: Team) -> Int {
        var points = 0
        for game in gamesPlayed(forTeam: team) {
            points += scorer.points(forTeam: team, inGame: game)
        }
        return points
    }
    
    func gamesPlayed(forPlayer player: Player) -> [Game] {
        var gamesForPlayer: [Game] = []
        for game in gamesPlayed {
            if game.players().contains(player) {
                gamesForPlayer.append(game)
            }
        }
        return gamesForPlayer
    }
    
    func gamesPlayed(forTeam team: Team) -> [Game] {
        var gamesForTeam: [Game] = []
        for game in gamesPlayed {
            if game.teams().contains(team) {
                gamesForTeam.append(game)
            }
        }
        return gamesForTeam
    }
    
    func allPossibleTeams() -> [Team] {
        var possibleTeams : [Team] = []
        for (index, player) in players.enumerated() {
            if index < players.count-1 {
                for otherIndex in index+1...players.count-1 {
                    possibleTeams.append(Team(withPlayers: [player, players[otherIndex]]))
                }
            }
        }
        return possibleTeams
    }
    
    func allPossibleGames() -> [Game] {
        var possibleGames : [Game] = []
        for (index, team) in teams.enumerated() {
            if index < teams.count-1 {
                for otherIndex in index+1...teams.count-1 {
                    if teams[otherIndex].canPlay(team) {
                        possibleGames.append(Game(withTeams: [team, teams[otherIndex]]))
                    }
                }
            }
        }
        return possibleGames
    }
    
    // MARK: - NSObject
    
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Tournament {
            return self.identifier == other.identifier
        }
        return false
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(identifier, forKey: identifierCodingKey)
        aCoder.encode(title, forKey: titleCodingKey)
        aCoder.encode(scorer, forKey: scorerCodingKey)
        aCoder.encode(players, forKey: playersCodingKey)
        aCoder.encode(teams, forKey: teamsCodingKey)
        aCoder.encode(gamesPlayed, forKey: gamesPlayedCodingKey)
        aCoder.encode(gamesToPlay, forKey: gamesToPlayCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        identifier = aDecoder.decodeObject(forKey: identifierCodingKey) as! String
        title = aDecoder.decodeObject(forKey: titleCodingKey) as! String
        scorer = aDecoder.decodeObject(forKey: scorerCodingKey) as! TournamentScorer
        players = aDecoder.decodeObject(forKey: playersCodingKey) as! [Player]
        teams = aDecoder.decodeObject(forKey: teamsCodingKey) as! [Team]
        gamesPlayed = aDecoder.decodeObject(forKey: gamesPlayedCodingKey) as! [Game]
        gamesToPlay = aDecoder.decodeObject(forKey: gamesToPlayCodingKey) as! [Game]
    }
    
}
