//
//  FifthViewController.swift
//  Assignment2
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    var imageText: String?
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var image5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goToFirstVC))
        if imageText == "Dungeon" {
            image5.image = #imageLiteral(resourceName: "dungeon")
            button5.isHidden = true
        } else if imageText == "Labratory" {
            image5.image = #imageLiteral(resourceName: "labratory")
            button5.setTitle("Generator", for: .normal)
        } else if imageText == "Mysterious Lake" {
            image5.image = #imageLiteral(resourceName: "mysterious_lake")
            button5.setTitle("Cursed Chalice", for: .normal)
        } else if imageText == "Back Porch" {
            image5.image = #imageLiteral(resourceName: "back_porch")
            button5.isHidden = true
        }
        
        button5.layer.cornerRadius = 10.0
        button5.layer.borderWidth = 1.0
        button5.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let lastVC = segue.destination as? LastViewController {
            //forthVC.imageText = "Bed room"
            if let title = (sender as? UIButton)?.titleLabel?.text {
                lastVC.imageText = title
            }
        }
    }
    
    @objc func goToFirstVC() {
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        //self.navigationController?.pushViewController(ViewController, animated: true)
    }

}
