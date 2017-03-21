//
//  StoryboardExtension.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func tournament() -> UIStoryboard {
        return UIStoryboard(name: "Tournament", bundle: nil)
    }
    
    static func main() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
