//
//  ViewExtension.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

extension UIView {
    
    static func viewFromNib() -> UIView? {
        return (Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil) as! [UIView]).first!
    }
}
