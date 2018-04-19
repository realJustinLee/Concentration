//
//  Concentration.swift
//  Concentration
//
//  Created by Justin Dell Adam on 1/15/18.
//  Copyright © 2018 Li Xin. All rights reserved.
//

import Foundation

class Concentration {
    var score = 0
    
    var flips = 0
    
    var cards = [Card]()
    
    var flippedCardsIDs = [Int]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var faceUpCardID: Int?
    
    func chooseCard(at index: Int){
        flips += cards[index].isFaceUp || cards[index].isMatched ? 0 : 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                flippedCardsIDs.append(cards[index].identifier)
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }else{
                    updateScore(for: [faceUpCardID!, cards[index].identifier])
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false;
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                faceUpCardID = cards[index].identifier
                flippedCardsIDs.append(faceUpCardID!)
            }
        }
    }
    
    private func updateScore(for cardsIDs: [Int]) {
        for id in cardsIDs {
            score -= (flippedCardsIDs.filter{$0 == id}.count - 1) >= 1 ? 1 : 0
        }
    }
    
    init(numbersOfPairsOfCards: Int){
        for _ in 1...numbersOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        // Shuffle the cards
        for cardIndex in 0..<cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(cardIndex, randomIndex)
        }
    }
}
