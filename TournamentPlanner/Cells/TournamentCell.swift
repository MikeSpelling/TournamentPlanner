//
//  TournamentCell.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class TournamentCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel?
    
    func update(withTournament tournament: Tournament) {
        titleLabel?.text = tournament.title
    }
    
}
