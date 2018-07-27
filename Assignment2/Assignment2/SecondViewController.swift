//
//  SecondViewController.swift
//  Assignment2
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet var buttonGroup: [UIButton]!
    var arr = ["Library", "Dining room", "Stairs up"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goToFirstVC))
        // Do any additional setup after loading the view.
        image2.image = #imageLiteral(resourceName: "coat_room")
        
        for i in buttonGroup.indices {
            buttonGroup[i].setTitle(arr[i], for: .normal)
            buttonGroup[i].layer.cornerRadius = 10.0
            buttonGroup[i].layer.borderWidth = 1.0
            buttonGroup[i].layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdVC = segue.destination as? ThirdViewController {
            thirdVC.imageText = segue.identifier
        }
    }
    
    @objc func goToFirstVC() {
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        //self.navigationController?.pushViewController(ViewController, animated: true)
    }
}
