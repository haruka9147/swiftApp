//
//  PlayingCardDeck.swift
//  TrumpCard
//
//  Created by 北田晴佳 on 2018/05/22.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    var cards = [PlayingCard]() // init empty array of PlayingCard
    // Array<PlayingCard>()
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                // designated initializer (struct gets it for free)
                // : initializer that initializes all properties.
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            // remove from cards array -> modifying PlayCardDeck Object (mutating)
            // random int from 0..<cards.count
            // 10.randomInt -> 0 <=  < 10
            return cards.remove(at: cards.count.randomInt)
        }
        return nil
    }
}

extension Int {
    var randomInt: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
