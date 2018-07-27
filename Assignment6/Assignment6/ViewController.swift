//
//  ViewController.swift
//  Assignment6
//
//  Created by 北田晴佳 on 2018/05/29.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let parentView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let parentView = MyScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        parentView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        let view1: UIView = UIView.init(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        view1.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        let view2: UIView = UIView.init(frame: CGRect(x: 150, y: 150, width: 150, height: 200))
        view2.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        let view3: UIView = UIView.init(frame: CGRect(x: 40, y: 400, width: 200, height: 150))
        view3.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        let view4: UIView = UIView.init(frame: CGRect(x: 100, y: 600, width: 180, height: 150))
        view4.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        parentView.addSubview(view1)
        parentView.addSubview(view2)
        parentView.addSubview(view3)
        parentView.addSubview(view4)
        
        self.view.addSubview(parentView)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        var frame:CGRect = self.view.bounds;
//        frame.origin.y += 100;
//        self.view.bounds = frame;
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

