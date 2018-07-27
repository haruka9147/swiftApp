//
//  PlayingCardView.swift
//  TrumpCard
//
//  Created by 北田晴佳 on 2018/05/23.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

@IBDesignable
class PlayingCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable
    var rank: Int = 5
    //var suit: String = ":clubs:"
    
    @IBInspectable
    var suit: String = "♣️"
    
    @IBInspectable
    var isFaceUp: Bool = true
    
    private lazy var upperLeftCornerLabel: UILabel = createCornerLabel()
    private lazy var lowerRightCornerLabel: UILabel = createCornerLabel()
    
    private func createCornerLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0 // use as many lines as needed (default: 1)
        self.addSubview(label)
        return label
    }
    
    private var cornerString: NSAttributedString {
        return centeredAttributedString(String(rank) + "\n" + suit, fontSize: cornerFontSize)
    }
    
    private func configureCornerLabel(_ label: UILabel) {
        label.attributedText = cornerString
        label.frame.size = CGSize.zero // no size
        label.sizeToFit() // make size to fit the content (content size)
        label.isHidden = !isFaceUp
    }
    
    override func draw(_ rect: CGRect) {
        // setNeedsDisplay()
        // Do not call this method manually
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        if isFaceUp {
            drawPips()
        } else {
            
        }
    }
    
    private func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        // 1. fontSize -> responsive
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize) // not responsive yet
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font) // responsive
        
        // 2. alignment -> centred (centered)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.font: font, .paragraphStyle: paragraphStyle])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay() // draw()
        setNeedsLayout()  // layoutSubview()
    }
    
    override func layoutSubviews() {
        // layout all my subviews
        super.layoutSubviews()
        
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
        
        configureCornerLabel(lowerRightCornerLabel)
        // CGAffineTransform
        // - transform (move to right)
        // - rotate
        // - scale
        lowerRightCornerLabel.transform = CGAffineTransform.identity
            .translatedBy(x: lowerRightCornerLabel.frame.size.width, y: lowerRightCornerLabel.frame.size.height)
            .rotated(by: CGFloat.pi) // radian 1pi = 180 degrees
        lowerRightCornerLabel.frame.origin = CGPoint.init(x: bounds.maxX, y: bounds.maxY)
            .offsetBy(dx: -cornerOffset, dy: -cornerOffset)
            .offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height)
        
    }
    
    private func drawPips()
    {
        let pipsPerRowForRank = [[0],[1],[1,1],[1,1,1],[2,2],[2,1,2],[2,2,2],[2,1,2,2,],[2,2,2,2],[2,2,1,2,2,],[2,2,2,2,2]]
        
        func createPipString(thatFits pipRect: CGRect) -> NSAttributedString {
            let maxVerticalPipCount = CGFloat(pipsPerRowForRank.reduce(0) { max($1.count, $0) })
            let maxHorizontalPipCount = CGFloat(pipsPerRowForRank.reduce(0) { max($1.max() ?? 0, $0) })
            let verticalPipRowSpacing = pipRect.size.height / maxVerticalPipCount
            let attemptedPipString = centeredAttributedString(suit, fontSize: verticalPipRowSpacing)
            let probablyOkayPipStringFontSize = verticalPipRowSpacing / (attemptedPipString.size().height / verticalPipRowSpacing)
            let probablyOkayPipString = centeredAttributedString(suit, fontSize: probablyOkayPipStringFontSize)
            if probablyOkayPipString.size().width > pipRect.size.width / maxHorizontalPipCount {
                return centeredAttributedString(suit, fontSize: probablyOkayPipStringFontSize /
                    (probablyOkayPipString.size().width / (pipRect.size.width / maxVerticalPipCount)))
            } else {
                return probablyOkayPipString
            }
        }
        
        if pipsPerRowForRank.indices.contains(rank) {
            let pipsPerRow = pipsPerRowForRank[rank]
            var pipRect = bounds.insetBy(dx: cornerOffset, dy: cornerOffset)
                .insetBy(dx: cornerString.size().width, dy: cornerString.size().height / 2)
            let pipString = createPipString(thatFits: pipRect)
            let pipRowSpacing = pipRect.size.height / CGFloat(pipsPerRow.count)
            pipRect.size.height = pipString.size().height
            pipRect.origin.y += (pipRowSpacing - pipRect.size.height) / 2
            for pipCount in pipsPerRow {
                switch pipCount {
                case 1:
                    pipString.draw(in: pipRect)
                case 2:
                    pipString.draw(in: pipRect.leftHalf)
                    pipString.draw(in: pipRect.rightHalf)
                default:
                    break
                }
                pipRect.origin.y += pipRowSpacing
            }
        }
    }

}

extension PlayingCardView {
    // helper methods
    private struct SizeRatioConstant {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatioConstant.cornerRadiusToBoundsHeight
    }
    
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatioConstant.cornerOffsetToCornerRadius
    }
    
    private var cornerFontSize:CGFloat {
        return bounds.size.height * SizeRatioConstant.cornerFontSizeToBoundsHeight
    }
    
    var rankString: String {
        switch rank {
            case 1: return "A"
            case 2...10: return String(rank)
            case 11: return "J"
            case 12: return "Q"
            case 13: return "K"
            default: return "?"
        }
    }
}

extension CGRect {
    var leftHalf: CGRect {
        return CGRect.init(x: minX, y: minY, width: width / 2, height: height)
    }
    
    var rightHalf: CGRect {
        return CGRect.init(x: midX, y: minY, width: width / 2, height: height)
    }
    
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(to size: CGSize) -> CGRect {
        return CGRect.init(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newwidth = width * scale
        let newheight = height * scale
        return insetBy(dx: (width - newwidth) / 2, dy: (height - newheight) / 2)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint.init(x: x + dx, y: y + dy)
    }
}
