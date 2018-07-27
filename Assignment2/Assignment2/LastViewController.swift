//
//  LastViewController.swift
//  Assignment2
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {
    
    var imageText: String?
    @IBOutlet weak var image6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goToFirstVC))
        // Do any additional setup after loading the view.
        if imageText == "Generator" {
            image6.image = #imageLiteral(resourceName: "generator")
        } else if imageText == "Cursed Chalice" {
            image6.image = #imageLiteral(resourceName: "cursed_chalice")
        }
    }
    
    @objc func goToFirstVC() {
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        //self.navigationController?.pushViewController(ViewController, animated: true)
    }

}
