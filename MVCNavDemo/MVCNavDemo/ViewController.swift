//
//  ViewController.swift
//  MVCNavDemo
//
//  Created by 北田晴佳 on 2018/05/17.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var dataTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.layer.cornerRadius = 10.0
        button.layer.borderColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        button.layer.borderWidth = 1.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Every segue has identifier (id)
        if segue.identifier == "first" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.data = dataTF.text
            }
        }
    }

}

