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
        
        print("Played:")
        for game in tournament.gamesPlayed {
            print(game)
        }
        print("\nTo play:")
        for game in tournament.gamesToPlay {
            print(game)
        }
        print("\nPoints:")
        for player in tournament.players {
            let points = tournament.points(forPlayer: player)
            print("\(player): \(points)")
        }
    }
    
}
