//
//  Score.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Score: NSObject, NSCoding {
    let team: Team
    private let teamCodingKey = "ScoreTeam"
    let value: Int
    private let valueCodingKey = "ScoreValue"
    
    init(withTeam team: Team, value: Int) {
        self.team = team
        self.value = value
    }
    
    init(withPlayer player: Player, value: Int) {
        self.team = Team(withPlayers: [player])
        self.value = value
    }
    
    func value(forPlayer player: Player?) -> Int {
        if player != nil {
            if team.players.contains(player!) {
                return value
            }
        }
        return 0
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(team, forKey: teamCodingKey)
        aCoder.encode(value, forKey: valueCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        team = aDecoder.decodeObject(forKey: teamCodingKey) as! Team
        value = aDecoder.decodeInteger(forKey: valueCodingKey)
    }
    
    // MARK: - NSObject
    
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Score {
            return
                team   == other.team   &&
                value  == other.value
        }
        return false
    }
    
    override public var description:String {
        return "\(team):\(value)"
    }
}
