//
//  Card.swift
//  Concentration
//
//  Created by Jay on 2022/9/19.
//

import Foundation

struct Card{
    var isFaceUp:Bool
    var isMatched:Bool
    var cardID:Int
    static var currentID = 0
    init(){
        isFaceUp =  false
        isMatched = false
        Card.currentID+=1
        cardID = Card.currentID
    }
}
