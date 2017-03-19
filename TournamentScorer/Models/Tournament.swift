//
//  Tournament.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Tournament {
    
    public var players: [Player]
    
    public var teams: [Team] = []
    
    var gamesPlayed: [Game] = []
    
    
    init() {
        players = [Player(withName: "A"),
                   Player(withName: "B"),
                   Player(withName: "C"),
                   Player(withName: "D"),
                   Player(withName: "E")]
        
        teams = allPossibleTeams()
        
        let score1 = Score(withTeam: teams.first!, points: 2)
        let score2 = Score(withTeam: teams.last!, points: 4)
        let testGame = Game(withScores: [score1, score2])
        gamesPlayed = [testGame]
        
        print("possible games(\(allPossibleGames().count)): \(allPossibleGames())")
        print("teams: \(teams)")
        print(points(forPlayer: players.first!))
    }
    
    func points(forPlayer player:Player) -> UInt {
        var points: UInt = 0
        for game in games(forPlayer: player) {
            points += game.points(forPlayer: player)
        }
        return points
    }
    
    func games(forPlayer player:Player) -> [Game] {
        var gamesForPlayer: [Game] = []
        for game in gamesPlayed {
            if game.includes(player: player) {
                gamesForPlayer.append(game)
            }
        }
        return gamesForPlayer
    }
    
    func remainingGames(forPlayer player:Player) -> [Game] {
        var remainingGames: [Game] = []
        for game in allPossibleGames() {
            if !game.includes(player: player) {
                remainingGames.append(game)
            }
        }
        return remainingGames
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
                    if teams[otherIndex].canPlay(team: team) {
                        possibleGames.append(Game(withTeams: [team, teams[otherIndex]]))
                    }
                }
            }
        }
        return possibleGames
    }
    
}
