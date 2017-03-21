//
//  NavigationControllerExtension.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func presentMasterViewController(withTournament tournament: Tournament) {
        if let masterViewController = UIStoryboard.tournament.instantiateInitialViewController() as? MasterViewController {
            masterViewController.tournament = tournament
            self.present(masterViewController, animated: true, completion: nil)
        }
    }

}
