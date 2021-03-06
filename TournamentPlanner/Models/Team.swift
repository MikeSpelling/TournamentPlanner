//
//  Team.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 19/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Team: NSObject, NSCoding {
    
    private let identifier: String
    private let identifierCodingKey = "TeamIdentifier"
    
    let players: [Player]
    private let playersCodingKey = "TeamPlayers"
    
    init(withPlayers players:[Player]) {
        self.identifier = UUID().uuidString
        self.players = players
    }
    
    func canPlay(_ team: Team?) -> Bool {
        if team != nil {
            for player in players {
                if team!.players.contains(player) {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(identifier, forKey: identifierCodingKey)
        aCoder.encode(players, forKey: playersCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        identifier = aDecoder.decodeObject(forKey: identifierCodingKey) as! String
        players = aDecoder.decodeObject(forKey: playersCodingKey) as! [Player]
    }
    
    // MARK: - NSObject
    
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Team {
            return players == other.players
        }
        return false
    }
    
    override public var description:String {
        var string = ""
        for player in players {
            string += player.name
            if players.index(of: player)! < players.count-1 {
                string += "&"
            }
        }
        return string
    }
    
}
