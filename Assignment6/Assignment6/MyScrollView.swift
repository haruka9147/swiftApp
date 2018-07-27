//
//  MyScrollView.swift
//  Assignment6
//
//  Created by 北田晴佳 on 2018/05/29.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class MyScrollView: UIView {
    
    var contentSize: CGSize?
    var panGesture: UIPanGestureRecognizer?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        contentSize = CGSize(width: frame.width, height: frame.height)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPan(sender:)))
        self.addGestureRecognizer(panGesture!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    @objc func doPan(sender: UIPanGestureRecognizer) {
        let move:CGPoint = sender.translation(in: self)
//        sender.view!.center.x += move.x
        sender.view!.center.y += move.y
        sender.setTranslation(CGPoint(x:0 , y:0), in: self)
    }
    
}
