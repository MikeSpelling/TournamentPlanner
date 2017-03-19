//
//  PlayerSummaryCell.swift
//  DoublesScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class PlayerSummaryCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel?
    
    func update(withPlayer player: Player) {
        nameLabel?.text = player.name
    }

}
