//
//  Concentration.swift
//  Concentration
//
//  Created by Justin Dell Adam on 1/15/18.
//  Copyright © 2018 Li Xin. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false;
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numbersOfPairsOfCards: Int){
        for _ in 1...numbersOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        // TODO: Shuffle the cards
        for cardIndex in 0..<cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(cardIndex, randomIndex)
        }
    }
}
