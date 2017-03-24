//
//  Player.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation

class Player: NSObject, NSCoding {
    
    private let identifier: String
    private let identifierCodingKey = "PlayerIdentifier"
    
    let name: String
    private let nameCodingKey = "PlayerName"
    
    init(withName name: String) {
        self.identifier = UUID().uuidString
        self.name = name
    }
    
    // MARK: - NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(identifier, forKey: identifierCodingKey)
        aCoder.encode(name, forKey: nameCodingKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: nameCodingKey) as! String
        identifier = aDecoder.decodeObject(forKey: identifierCodingKey) as! String
    }
    
    // MARK: - NSObject
    
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Player {
            return identifier == other.identifier
        }
        return false
    }
    
    override public var description:String {
        return name
    }
    
}
