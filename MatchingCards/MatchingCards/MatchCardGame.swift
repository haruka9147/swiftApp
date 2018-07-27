//
//  MatchCardGame.swift
//  MatchingCards
//
//  Created by 北田晴佳 on 2018/05/15.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import Foundation

// API: A set of methods and vars

struct MatchCardGame {
    private(set) var cards = [Card]()
    private(set) var indexOfOneOnlyCardFacedUp: Int? {
        get {
            var foundIndex: Int?
            for i in cards.indices {
                if cards[i].isFaceUP {
                    if foundIndex == nil {
                        foundIndex = i
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        } set {
            for i in cards.indices {
                cards[i].isFaceUP = (i == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "MatchCardGame.chooseCard(at: \(index): chosen index not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneOnlyCardFacedUp, matchIndex != index{
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
            } else {
                indexOfOneOnlyCardFacedUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "MatchCardGame.init(\(numberOfPairsOfCards): you must have at least 1 pair of cards.")
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // MARK: Shuffle
        cards = cards.shuffled()
        print(cards)
    }

}

extension MutableCollection {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: numericCast(arc4random_uniform(numericCast(diff))))
            swapAt(i, j)
        }
    }
}

extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}
