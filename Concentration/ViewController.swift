//
//  ViewController.swift
//  Concentration
//
//  Created by Jay on 2022/9/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cardButtons: [UIButton]!
    lazy var game = ConcentrationModel(initialCardsNum: (cardButtons.count+1)/2);

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of:sender){
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        }
    }
    let emojis = ["🔪","🎡","😈","💏"];
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.backgroundColor=UIColor.systemOrange
                button.setTitle("", for: .normal)
                
            }else{
                button.backgroundColor=UIColor.white
                button.setTitle(emoji(for: card), for: .normal)
            }
        }
    }
    func emoji(for card:Card)->String{
        return "?"
    }
}

