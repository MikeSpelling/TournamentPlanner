//
//  LeaderboardViewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

class LeaderboardViewController: BaseTournamentViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarTitleForTournament()
        setNavigationBarTournamentsButton()
        
        print("- \(tournament.title)\nPlayed:")
        for game in tournament.gamesPlayed {
            print(game)
        }
        print("\nTo play:")
        for game in tournament.gamesToPlay {
            print(game)
        }
        print("\nPlayer Points:")
        for score in tournament.playerLeaderboard() {
            print("\(score.team): \(score.value)")
        }
        print("\nTeam Points:")
        for score in tournament.teamLeaderboard() {
            print("\(score.team): \(score.value)")
        }
        print("")
    }
    
}
