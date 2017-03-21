//
//  BaseVIewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tournament: Tournament?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showTournamentsView))
    }
    
    @objc private func showTournamentsView() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.showTournamentsView()
        }
    }

}
