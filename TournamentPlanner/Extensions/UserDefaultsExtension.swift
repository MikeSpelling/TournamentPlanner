//
//  UserDefaultsHelper.swift
//  TournamentScorer
//
//  Created by Mike Atkins-Spelling on 21/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static private let tournamentsKey = "UserDefaultsTournaments"
    
    static var tournaments: [Tournament] {
        get {
            if let savedTournamentsData = UserDefaults.standard.object(forKey: tournamentsKey) as? Data {
                if let savedTournaments = NSKeyedUnarchiver.unarchiveObject(with: savedTournamentsData) as? [Tournament] {
                    return savedTournaments
                }
            }
            return []
        }
        
        set {
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: newValue), forKey: tournamentsKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func save(tournament tournamentOrNil: Tournament?) {
        if let tournament = tournamentOrNil {
            var currentTournaments = UserDefaults.tournaments
            let index = currentTournaments.index(of: tournament)
            
            if (index == nil) {
                currentTournaments.append(tournament)
            } else {
                currentTournaments[index!] = tournament
            }
            
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: currentTournaments), forKey: tournamentsKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func delete(tournament tournamentOrNil: Tournament?) {
        if let tournament = tournamentOrNil {
            var currentTournaments = UserDefaults.tournaments
            let index = currentTournaments.index(of: tournament)
            
            if (index != nil) {
                currentTournaments.remove(at: index!)
            }
            
            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: currentTournaments), forKey: tournamentsKey)
            UserDefaults.standard.synchronize()
        }
    }
}
