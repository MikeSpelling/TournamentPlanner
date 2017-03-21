//
//  MasterViewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 20/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class MasterViewController: UITabBarController {
    
    var tournament: Tournament?
    var hasSetupView: Bool = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (!hasSetupView) {
            setupTabs()
            showTournamentsView()
            hasSetupView = true
        }
    }
    
    func showTournamentsView() {
        tabsNavigationController().present(TournamentsViewController(withDelegate: self), animated: false, completion: nil)
    }
    
    // MARK: - Private
    
    fileprivate func setupTabs() {
        for tabNavigationController in viewControllers as! [UINavigationController] {
            tabNavigationController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showTournamentsView))
        }
    }
    
    fileprivate func tabsNavigationController() -> UINavigationController {
        return viewControllers?[selectedIndex] as! UINavigationController
    }

}

extension MasterViewController: TournamentsViewControllerDelegate {
    
    internal func selected(tournament: Tournament) {
        self.tournament = tournament
        tabsNavigationController().dismiss(animated: true, completion: nil)
    }

}


