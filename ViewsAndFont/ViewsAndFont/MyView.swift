//
//  MyView.swift
//  ViewsAndFont
//
//  Created by 北田晴佳 on 2018/05/18.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

// Drawing code
// CGFloat - Core Graphics Float
// CGPoint - struct with two CGFloats x, y
// CGSize - struct with two CGFloats width, height
// CGRect - struct with a CGPoint and a COSize
// let point: CGPoint = CGPoint(x: 10, y: 10)
// let size: CGSize = CGSize(width: 100, height: 100)
// let rectangle: CGRect = CGRect(origin: point, size: size)
// rectangle.midX
// rectangle.midY
// rectangle.intersects(rectangle)

// UIView
// - bounds: CGRect - draw (relative to yourself) (self origin)
// - frame: CGRect - translate, rotate, scale (its superview)
// - center: CGPoint - translate, rotate, scale (its superview)
// - isHidden: Bool
// - backgroundColor: UIColor
// - alpha: CGFloat - transparent


// UIGraphicsGetCurrentContent() - gives a context you can use to draw in draw (CGRect)
// UIBezierPath - easier to manage. automatically draws in the current context
//              - has many methods

import UIKit

@IBDesignable
class MyView: UIView {
    
    @IBInspectable
    var labelWidth: Int = 300
    
    lazy var label = UILabel(frame: CGRect.init(x: 10, y: 10, width: labelWidth, height: 100))
    
    @IBInspectable
    var content: String = "AAAAAA" {
        didSet {
            label.text = content
        }
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        content = "Changed!"
    }
    
    @IBInspectable
    var color: UIColor = .yellow

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
        //label.text = content
       
        self.addSubview(label)
        // Draw star! Yellow Star!
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 80, y: 80))
//        path.addLine(to: CGPoint(x: 140, y: 150))
//        path.addLine(to: CGPoint(x: 10, y: 150))
//        path.close()
//
//        UIColor.green.setFill()
//        UIColor.red.setStroke()
//        path.fill()
//        path.stroke()
//        path.addClip()
//
//        let path2 = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 100, height: 100), cornerRadius: 16)
//        UIColor.blue.setFill()
//        path2.fill()
    
//        let polygonPath = UIBezierPath()
//
//        let xCenter: CGFloat = 100
//        let yCenter: CGFloat = 100
//
//        let w = CGFloat(200)
//        let r = w / 2.0
//        let flip: CGFloat = -1.0 // use this to flip the figure 1.0 or -1.0
//
//        let polySide = CGFloat(5)
//
//        let theta = 2.0 * Double.pi * Double(2.0 / polySide)
//
//        polygonPath.move(to: CGPoint(x: xCenter, y: r * flip + yCenter))
//
//        for i in 1..<Int(polySide) {
//            let x: CGFloat = r * CGFloat( sin(Double(i) * theta) )
//            let y: CGFloat = r * CGFloat( cos(Double(i) * theta) )
//            polygonPath.addLine(to: CGPoint(x: x + xCenter, y: y * flip + yCenter))
//        }
//
//        polygonPath.close()
//
//        UIColor.yellow.setStroke()
//        UIColor.yellow.setFill()
//        polygonPath.fill()
//        polygonPath.stroke()
//
//        backgroundColor = UIColor.black
//        let str = "AAAA" // we want to change the
//        let metrics = UIFontMetrics(forTextStyle: .body)
//        let font = UIFont(name: "Helvetica", size: 36)
//        let fontToUSe = metrics.scaledFont(for: font!)
//        let text = NSAttributedString(string: str, attributes: [.font: fontToUSe])
//        text.draw(at: CGPoint.init(x: 0, y: 0))
        
        
        
//        let range = NSRange(str.startIndex..<str.endIndex, in: str)
//        text.attribute(.font, at: 0, effectiveRange: range)

        
//        let starLine = UIBezierPath()
//        starLine.move(to: CGPoint.init(x: 140, y: 140))
//        starLine.addLine(to: CGPoint.init(x: 170, y: 180))
//        starLine.addLine(to: CGPoint.init(x: 220, y: 180))
//        starLine.addLine(to: CGPoint.init(x: 180, y: 220))
//        starLine.addLine(to: CGPoint.init(x: 200, y: 270))
//        starLine.addLine(to: CGPoint.init(x: 140, y: 240))
//        starLine.addLine(to: CGPoint.init(x: 80, y: 270))
//        starLine.addLine(to: CGPoint.init(x: 100, y: 220))
//        starLine.addLine(to: CGPoint.init(x: 50, y: 180))
//        starLine.addLine(to: CGPoint.init(x:110, y: 180))
//        starLine.close()
//        //starLine.close()
//        UIColor.yellow.setFill()
//        UIColor.yellow.setStroke()
//        starLine.fill()
//        starLine.stroke()
//
//        let starLayer = CAShapeLayer.init()
//        let starFrame = CGRect.init(x: 40, y: 440, width: 100, height: 100)
//        starLayer.frame = starFrame
//
//        // 輪郭の色
//        starLayer.strokeColor = UIColor.yellow.cgColor
//        // 星の中の色
//        starLayer.fillColor = UIColor.yellow.cgColor
//
//        let path3 = UIBezierPath()
//        path3.move(to: CGPoint.init(x: 0, y: starFrame.size.height / 3))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width / 3, y: starFrame.size.height / 3))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width / 2, y: 0))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width * 2 / 3, y: starFrame.size.height / 3))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width, y: starFrame.size.height / 3))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width * 3 / 4, y: starFrame.size.height * 3 / 5))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width * 9 / 10 , y: starFrame.size.height * 9 / 10))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width / 2, y: starFrame.size.height * 3 / 4))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width / 10 , y: starFrame.size.height * 9 / 10))
//        path3.addLine(to: CGPoint.init(x: starFrame.size.width / 4, y: starFrame.size.height * 3 / 5))
//        path3.close()
//
//        starLayer.path = path3.cgPath
//        layer.addSublayer(starLayer)
    }
    

}
