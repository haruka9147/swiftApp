//
//  ViewController.swift
//  TrumpCard
//
//  Created by 北田晴佳 on 2018/05/22.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<10 {
            if let card = deck.draw() {
                print(card)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // animation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // networking, database
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // clean up code
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // if your bounds change, you want to reposition some of your
        // subviews...
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        // when your device rotates, (viewWill/DidLayoutSubviews) get called and then call viewWillTransition
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // it is rare, but occasionally your device will run low-memory.
        // This usually means a buildup of very large videos, images or sounds.
        // When a low-memory occurs, iOS will call this method.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // This methods is called to all objects that come out of a storyboard.
        // Can Initialize stuff.
    }

}

