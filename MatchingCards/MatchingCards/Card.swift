//
//  Card.swift
//  MatchingCards
//
//  Created by 北田晴佳 on 2018/05/15.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUP = false
    var isMatched = false
    private var identifier: Int
    
    static var identifierMaker = 0
    static func getUniqueIdentifier() -> Int {
        identifierMaker += 1
        return identifierMaker
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

extension Card: Hashable {
    var hashValue: Int {
        return identifier
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

