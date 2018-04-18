//
//  Card.swift
//  Concentration
//
//  Created by Justin Dell Adam on 1/15/18.
//  Copyright © 2018 Li Xin. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identitiferFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identitiferFactory += 1
        return identitiferFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
