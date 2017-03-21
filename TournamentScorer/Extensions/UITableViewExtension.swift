//
//  UITableViewExtension.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

extension UITableView {

    func registerCell(ofType cellType: UITableViewCell.Type) {
        register(UINib(nibName: cellType.identifier, bundle: nil), forCellReuseIdentifier: cellType.identifier)
    }
    
}
