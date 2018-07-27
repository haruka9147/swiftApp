//
//  ThirdViewController.swift
//  Assignment2
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var imageText: String?

    @IBOutlet var buttonGroup: [UIButton]!
    @IBOutlet weak var image3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goToFirstVC))
        // Do any additional setup after loading the view.
        if imageText == "library" {
            image3.image = #imageLiteral(resourceName: "library")
            buttonGroup[0].setTitle("Secret Passage", for: .normal)
            buttonGroup[1].isHidden = true
        } else if imageText == "dining" {
            image3.image = #imageLiteral(resourceName: "dining_room")
            buttonGroup[0].setTitle("Kitchen", for: .normal)
            buttonGroup[1].isHidden = true
        } else {
            image3.image = #imageLiteral(resourceName: "stairs_up")
            buttonGroup[0].setTitle("Bed room", for: .normal)
            buttonGroup[1].setTitle("Bath room", for: .normal)
        }
        
        for i in buttonGroup.indices {
            buttonGroup[i].layer.cornerRadius = 10.0
            buttonGroup[i].layer.borderWidth = 1.0
            buttonGroup[i].layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let forthVC = segue.destination as? ForthViewController {
            //forthVC.imageText = "Bed room"
            if let title = (sender as? UIButton)?.titleLabel?.text {
                forthVC.imageText = title
            }
        }
    }
    
    @objc func goToFirstVC() {
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        //self.navigationController?.pushViewController(ViewController, animated: true)
    }
}
