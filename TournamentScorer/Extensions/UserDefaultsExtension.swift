//
//  UserDefaultsHelper.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static var tournaments: [Tournament] {
        if let savedTournamentsData = UserDefaults.standard.object(forKey: "tournaments") as? Data {
            if let savedTournaments = NSKeyedUnarchiver.unarchiveObject(with: savedTournamentsData) as? [Tournament] {
                return savedTournaments
            }
        }
        return [Tournament(withTitle: "Test Tournament 1")]
    }
    
    static func save(tournament: Tournament) {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: tournament), forKey: "tournaments")
        UserDefaults.standard.synchronize()
    }
}
