//
//  SecondViewController.swift
//  MVCNavDemo
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataLabel.text = data
    }

}
