//
//  MasterViewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 20/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class MasterViewController: UITabBarController {
    
    func set(tournament: Tournament) {
        for viewController in viewControllers! {
            if let tabNavigationController = viewController as? UINavigationController {
                if let rootViewController = tabNavigationController.viewControllers.first as? BaseViewController {
                    rootViewController.tournament = tournament
                }
            }
        }
    }
    
}


