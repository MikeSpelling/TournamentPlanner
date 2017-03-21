//
//  BaseVIewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tournament: Tournament {
        let masterViewController = tabBarController as! MasterViewController
        return masterViewController.tournament!
    }
    
    @objc internal func showTournamentsView() {
        self.dismiss(animated: true, completion: nil)
    }

}
