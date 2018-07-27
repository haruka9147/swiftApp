//
//  MyCollectionViewFlowLayoutWithDecorations.swift
//  Assignment7
//
//  Created by 北田晴佳 on 2018/05/30.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class MyCollectionViewFlowLayoutWithDecorations: UICollectionViewFlowLayout {
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath)
        attributes?.transform = CGAffineTransform.init(translationX: 0, y: 500.0)
        
        return attributes
    }
}
