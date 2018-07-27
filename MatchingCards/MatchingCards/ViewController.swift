//
//  ViewController.swift
//  MatchingCards
//
//  Created by 北田晴佳 on 2018/05/14.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var tempString: String = ""
    var tempIndex: Int?
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private lazy var game = MatchCardGame(numberOfPairsOfCards: cardButtons.count / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    fileprivate func flipCard(withEmoji emoji: String, index idx: Int, on button: UIButton) {
//        
//        if button.currentTitle == emoji {
//            button.setTitle("", for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
//        
//        // Check result
//        if tempString == "" && tempIndex == nil {
//            tempString = emoji
//            tempIndex = idx
//        } else {
//            if tempString == emoji {
//                let alert: UIAlertController = UIAlertController(title: "Matched!", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
//    
//                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
//                    (action: UIAlertAction!) -> Void in
//                    //print("OK")
//                    button.isHidden = true
//                    if let i = self.tempIndex {
//                        self.cardButtons[i].isHidden = true
//                    }
//                    self.tempIndex = nil
//                    self.tempString = ""
//                })
//    
//                alert.addAction(defaultAction)
//    
//                present(alert, animated: true, completion: nil)
//                
//            } else {
//                let alert: UIAlertController = UIAlertController(title: "Not Matched!", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
//                
//                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
//                    (action: UIAlertAction!) -> Void in
//                    //print("OK")
//                    button.setTitle("", for: .normal)
//                    button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//                    if let i = self.tempIndex {
//                        self.cardButtons[i].setTitle("", for: .normal)
//                        self.cardButtons[i].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//                    }
//                    self.tempIndex = nil
//                    self.tempString = ""
//                })
//                
//                alert.addAction(defaultAction)
//                
//                present(alert, animated: true, completion: nil)
//                
//            }
//            
//        }
//    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        // display emoji
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateUIFromModel()
            
            //print(game.indexOfOneOnlyCardFacedUp)
            
            //print(game.cards[cardNumber].isMatched)
            if (game.indexOfOneOnlyCardFacedUp == nil) {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
                    for i in self.cardButtons.indices {
                        let button = self.cardButtons[i]
                        let card = self.game.cards[i]
                        if card.isMatched {
                            button.setTitle("", for: .normal)
                            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                        } else {
                            button.setTitle("", for: .normal)
                            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                        }
                    }
                }
            }
            // updateUI
            //flipCard(withEmoji: emojiChoices[cardNumber], index: cardNumber, on: sender)
        } else {
            print("Chosen card was not in cardButton")
        }
    }
    
    private func updateUIFromModel() {
        for i in cardButtons.indices {
            let button = cardButtons[i]
            let card = game.cards[i]
            if card.isFaceUP {
                button.setTitle(emojiShow(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
//                if flipCount % 2 == 0 {
//                    
//                }
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃", "👻", "👹", "👺", "😈", "🤡"] // cmd + ctrl + space
    lazy var emoji = [Card:String]()
    private func emojiShow(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //print(randomIndex)
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card] ?? "!"
    }
    
}

