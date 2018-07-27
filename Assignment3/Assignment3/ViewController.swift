//
//  ViewController.swift
//  Assignment3
//
//  Created by 北田晴佳 on 2018/05/22.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawArea: DrawView!
    @IBOutlet var colorList: [UIButton]!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var eraser: UIButton!
    @IBOutlet weak var undoBtn: UIButton!
    @IBOutlet weak var createText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //drawArea.paintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        sizeSlider.value = 5.0
        colorList[0].layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        colorList[0].layer.borderWidth = 2.0
    }

    @IBAction func changeColor(_ sender: UIButton) {
        drawArea.isErase = false
        eraser.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        for i in colorList.indices {
            colorList[i].layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        let color = sender.backgroundColor
        sender.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        sender.layer.borderWidth = 2.0
        drawArea.paintColor = color!
    }
    
    @IBAction func changeSize(_ sender: UISlider) {
        //print(sizeSlider.value)
        drawArea.paintSize = CGFloat(sizeSlider.value)
        
    }
    
    @IBAction func erasePath(_ sender: UIButton) {
        drawArea.paintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        drawArea.isErase = true
        eraser.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        eraser.layer.borderWidth = 2.0
        //print(drawArea.isErase)
    }
    
    @IBAction func undo(_ sender: UIButton) {
        drawArea.clearDraw()
    }
    
    @IBAction func createTextArea(_ sender: UIButton) {
        drawArea.addTextArea()
    }
}

