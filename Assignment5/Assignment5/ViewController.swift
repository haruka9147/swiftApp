//
//  ViewController.swift
//  Assignment5
//
//  Created by 北田晴佳 on 2018/05/28.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor.red // 背景を赤に
        
        //let tab = UITabBarController()
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        self.view.addSubview(button)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pushToNextVC() {
        let newVC = UIViewController()
        newVC.view.backgroundColor = UIColor.red
        self.navigationController?.pushViewController(newVC, animated:
            true)
    }

}

