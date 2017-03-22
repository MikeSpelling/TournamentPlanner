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
        
        UserDefaults.save(tournament: Tournament(withTitle: "\(Date())"))
        
        tableView?.registerCell(ofType: PlayerSummaryCell.self)
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
