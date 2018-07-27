//
//  DrawView.swift
//  Assignment3
//
//  Created by 北田晴佳 on 2018/05/22.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class DrawView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var paintColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    var paintSize: CGFloat = 5.0
    var isErase = false
    var imageArr = [UIImage]()
    var currentDrawNumber = 0
    var textViewArr = [UITextView]()
    
    private var path: UIBezierPath!
    private var lastDrawImage: UIImage!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
    }
    
//    override func draw(_ rect: CGRect) {
//        lastDrawImage?.draw(at: CGPoint.zero)
//        paintColor.setStroke()
//        path?.stroke()
//        //imageArr.append(UIImage())
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)
        path = UIBezierPath()
        path?.lineWidth = paintSize
        path?.lineCapStyle = CGLineCap.round
        path?.lineJoinStyle = CGLineJoin.round
        path?.move(to: currentPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)
        path.addLine(to: currentPoint)
        //lastDrawImage = snapShot()
        //setNeedsDisplay()
        drawLine()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        imageArr.append(lastDrawImage)
//        currentDrawNumber += 1
        let currentPoint = touches.first!.location(in: self)
        path.addLine(to: currentPoint)
        drawLine()
        lastDrawImage = self.image
    }
    
    func drawLine() {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        lastDrawImage?.draw(at: CGPoint.zero)
        paintColor.setStroke()
        if isErase {
            path?.stroke(with: .clear, alpha: 0)
        } else {
            path?.stroke()
        }
        self.image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
    
//    func snapShot() -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
//        lastDrawImage?.draw(at: CGPoint.zero)
//        paintColor.setStroke()
//        if isErase {
//            path?.stroke(with: .clear, alpha: 0)
//        } else {
//            path?.stroke()
//        }
//        let image = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return image
//    }
    
//    func undoImage() {
//        if currentDrawNumber > 0 {
//            lastDrawImage = imageArr[currentDrawNumber - 1]
//            lastDrawImage = snapShot()
//            setNeedsDisplay()
//            currentDrawNumber -= 1
//        }
//    }
    
    func clearDraw() {
        lastDrawImage = nil
        self.image = nil
        let subviews = self.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    func addTextArea() {
        let txtField: UITextField = UITextField(frame: CGRect(x: 50, y: 50, width: 200.0, height: 30.00));
//        let gesture = UIPanGestureRecognizer(target: self, action: #selector(DrawView.userDragged(_:)))
//        txtField.borderStyle = UITextBorderStyle.line
//        txtField.addGestureRecognizer(gesture)
//        txtField.isUserInteractionEnabled = true
        txtField.text = "Textarea"
        //txtField.backgroundColor = UIColor.redColor()
        self.addSubview(txtField)
        txtField.becomeFirstResponder()
    }
    
//    @objc func userDragged(_ gesture: UIPanGestureRecognizer) {
//        var loc = gesture.location(in: self)
//
//        //text
//    }

}
