//
//  Tournament.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Tournament {
    
    public var title: String = ""
    
    public var scorer: TournamentScorer = TournamentScorer(winValueUsesPointDifference: true)
    
    public var players: [Player] = []
    
    public var teams: [Team] = []
    
    var gamesPlayed: [Game] = []
    
    
    init(withTitle title: String) {
        self.title = title
        
        players = [Player(withName: "Mike"),
                   Player(withName: "Sam"),
                   Player(withName: "Haroon"),
                   Player(withName: "James"),
                   Player(withName: "Antony")]
        
        teams = allPossibleTeams()
        
        let testGame1 = Game(withScores: [Score(withTeam: teams.first!, value: 2),
                                          Score(withTeam: teams.last!, value: 4)])
        
        let testGame2 = Game(withScores: [Score(withTeam: teams[2], value: 15),
                                          Score(withTeam: teams[4], value: 11)])
        gamesPlayed = [testGame1, testGame2]
        
        print("teams: \(teams)")
        print("\(allPossibleGames().count) games:")
        for game in allPossibleGames() {
            print(game)
        }
    }
    
    func games(forPlayer player:Player) -> [Game] {
        var gamesForPlayer: [Game] = []
        for game in gamesPlayed {
            if game.players().contains(player) {
                gamesForPlayer.append(game)
            }
        }
        return gamesForPlayer
    }
    
    func remainingGames(forPlayer player:Player) -> [Game] {
        var remainingGames: [Game] = []
        for game in allPossibleGames() {
            if !game.players().contains(player) {
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
                    if teams[otherIndex].canPlay(againstTeam: team) {
                        possibleGames.append(Game(withTeams: [team, teams[otherIndex]]))
                    }
                }
            }
        }
        return possibleGames
    }
    
}
