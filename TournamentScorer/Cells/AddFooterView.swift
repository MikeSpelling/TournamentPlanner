//
//  AddFooterView.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

protocol AddFooterViewDelegate {
    func footerTapped(footer: AddFooterView);
}

class AddFooterView: UIView {
    
    var delegate: AddFooterViewDelegate?
    
    @IBOutlet weak var button: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button?.addTarget(self, action: #selector(addHitState), for: [.touchDown, .touchDragEnter])
        button?.addTarget(self, action: #selector(removeHitState), for: [.touchUpInside, .touchDragExit, .touchCancel])
    }
    
    // MARK: - Actions
    
    @IBAction func footerTapped() {
        delegate?.footerTapped(footer: self)
    }
    
    // MARK: - Hit states
    
    @objc private func addHitState() {
        self.alpha = 0.5;
    }
    
    @objc private func removeHitState() {
        UIView.animate(withDuration: 0.3) { 
            self.alpha = 1
        }
    }
    
}
