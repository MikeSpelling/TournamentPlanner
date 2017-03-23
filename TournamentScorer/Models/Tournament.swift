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
    
    func playerLeaderboard() -> [Score] {
        var scores = [Score]()
        for player in players {
            scores.append(scorer.score(forPlayer:   player,
                                       inGames:     gamesPlayed(forPlayer: player)))
        }
        return Score.sort(scores)
    }
    
    func teamLeaderboard() -> [Score] {
        var scores = [Score]()
        for team in teams {
            scores.append(scorer.score(forTeam: team,
                                       inGames: gamesPlayed(forTeam: team)))
        }
        return Score.sort(scores)
    }
    
    func gamesPlayed(forPlayer player: Player?) -> [Game] {
        var gamesForPlayer: [Game] = []
        if player != nil {
            for game in gamesPlayed {
                if game.players().contains(player!) {
                    gamesForPlayer.append(game)
                }
            }
        }
        return gamesForPlayer
    }
    
    func gamesPlayed(forTeam team: Team?) -> [Game] {
        var gamesForTeam: [Game] = []
        if team != nil {
            for game in gamesPlayed {
                if game.teams().contains(team!) {
                    gamesForTeam.append(game)
                }
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
