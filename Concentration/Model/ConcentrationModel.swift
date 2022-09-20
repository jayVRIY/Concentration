//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Jay on 2022/9/19.
//

import Foundation
class ConcentrationModel{
    var cards = [Card]()
    init(initialCardsNum:Int){
        for _ in 0..<initialCardsNum {
            let card = Card()
            cards += [card , card]
        }
    }
    func chooseCard(at index:Int){
        
    }
}
