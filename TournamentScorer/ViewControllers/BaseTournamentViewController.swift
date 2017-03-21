//
//  BaseVIewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class BaseTournamentViewController: UIViewController {
    
    var tournament: Tournament {
        let masterViewController = tabBarController as! MasterViewController
        return masterViewController.tournament!
    }
    
    func setNavigationBarTitleForTournament() {
        navigationItem.title = tournament.title
    }
    
    func setNavigationBarTournamentsButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(showTournamentsView))
    }
    
    @objc private func showTournamentsView() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

}
