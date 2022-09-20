//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Jay on 2022/9/19.
//

import Foundation
class ConcentrationModel{
    var cards = [Card]()
    var onlyOneFaceUpIndex:Int?{
        get{
            var foundIndex :Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index==newValue)
            }
        }
    }
    init(initialCardsNum:Int){
        for _ in 0..<initialCardsNum {
            let card = Card()
            cards += [card , card]
        }
        cards.shuffle()
    }
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = onlyOneFaceUpIndex, matchIndex != index{
                if cards[matchIndex].cardID == cards[index].cardID{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                onlyOneFaceUpIndex = index
            }
        }
    }
}
