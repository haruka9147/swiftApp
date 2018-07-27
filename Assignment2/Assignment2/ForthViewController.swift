//
//  ForthViewController.swift
//  Assignment2
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {
    
    var imageText: String?
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet var buttonGroup: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goToFirstVC))
        if imageText == "Secret Passage" {
            image4.image = #imageLiteral(resourceName: "secret_passage")
            buttonGroup[0].setTitle("Dungeon", for: .normal)
            buttonGroup[1].setTitle("Labratory", for: .normal)
            buttonGroup[2].setTitle("Mysterious Lake", for: .normal)
        } else if imageText == "Kitchen" {
            image4.image = #imageLiteral(resourceName: "kitchen")
            buttonGroup[0].setTitle("Back Porch", for: .normal)
            buttonGroup[1].isHidden = true
            buttonGroup[2].isHidden = true
        } else if imageText == "Bed room" {
            image4.image = #imageLiteral(resourceName: "bedroom")
            buttonGroup[0].isHidden = true
            buttonGroup[1].isHidden = true
            buttonGroup[2].isHidden = true
        } else {
            image4.image = #imageLiteral(resourceName: "bathroom")
            buttonGroup[0].isHidden = true
            buttonGroup[1].isHidden = true
            buttonGroup[2].isHidden = true
        }
        
        for i in buttonGroup.indices {
            buttonGroup[i].layer.cornerRadius = 10.0
            buttonGroup[i].layer.borderWidth = 1.0
            buttonGroup[i].layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let fifthVC = segue.destination as? FifthViewController {
            //forthVC.imageText = "Bed room"
            if let title = (sender as? UIButton)?.titleLabel?.text {
                fifthVC.imageText = title
            }
        }
    }
    
    @objc func goToFirstVC() {
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        //self.navigationController?.pushViewController(ViewController, animated: true)
    }

}
