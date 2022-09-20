//
//  ViewController.swift
//  Concentration
//
//  Created by Jay on 2022/9/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    lazy var game = ConcentrationModel(initialCardsNum: pairNumOfCards);
    var pairNumOfCards:  Int {
        get{
            (cardButtons.count+1)/2
        }
    }
    @IBOutlet weak var flipCount: UILabel!
    var flipTime = 0 {
        didSet{
            flipCount.text = "翻卡次数： \(flipTime)"
        }
    }
    @IBAction func replayGame(_ sender: UIButton) {
        game = ConcentrationModel(initialCardsNum: (cardButtons.count+1)/2);
        emojis = ["🔪","🎡","😈","💏","🔒","❤️","🌟","🐯","🔥","🌲","🐱","👩‍🏫"];
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of:sender){
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
            flipTime+=1
        }
    }
    var emojis = ["🔪","🎡","😈","💏","🔒","❤️","🌟","🐯","🔥","🌲","🐱","👩‍🏫"];    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.backgroundColor=UIColor.white
                button.setTitle(emoji(for: card), for: .normal)
            }else{
                button.backgroundColor = card.isMatched  ? UIColor(ciColor: .clear):UIColor.systemOrange
                button.setTitle("", for: .normal)
            }
        }
    }
    var emojiMap:[Int:String] = [:]
    func emoji(for card:Card)->String{
        if emojiMap[card.cardID] == nil&&emojis.count>0{
            let randomIndex = Int(arc4random_uniform (UInt32(emojis.count)))
            emojiMap[card.cardID] = emojis.remove(at: randomIndex)
        }
        return emojiMap[card.cardID] ?? "?"
    }
}

