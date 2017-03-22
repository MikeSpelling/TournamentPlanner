//
//  EditTournamentViewController.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class EditTournamentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTestTournament()
        
        tableView?.registerCell(ofType: PlayerSummaryCell.self)
    }
    
    func createTestTournament() {
        let tournament = Tournament(withTitle: "Test \(Date().timeIntervalSince1970)")
        tournament.players = [Player(withName: "Mike"), Player(withName: "Jony"), Player(withName: "Sam"), Player(withName: "James"), Player(withName: "Haroon")]
        tournament.teams = tournament.allPossibleTeams()
        
        var gamesToPlay = [Game]()
        var gamesPlayed = [Game]()
        for game in tournament.allPossibleGames() {
            if rand() == 0 {
                gamesToPlay.append(game)
            }
            else {
                game.scores = [Score(withTeam: game.teams().first!, value: rand(max: 11)),
                               Score(withTeam: game.teams().last!, value: rand(max: 11))]
                gamesPlayed.append(game)
            }
        }
        tournament.gamesPlayed = gamesPlayed
        tournament.gamesToPlay = gamesToPlay
        
        UserDefaults.save(tournament: tournament)
    }
    
    func rand(max: Int = 1) -> Int {
        return Int(arc4random_uniform(UInt32(max)) + 1)
    }
}

extension EditTournamentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: PlayerSummaryCell.self) as! TournamentCell
        return cell
    }
    
}

extension EditTournamentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
