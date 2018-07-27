//
//  MyCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by 北田晴佳 on 2018/06/01.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var isEditing: Bool = false {
        didSet {
            checkImage.isHidden = !isEditing
        }
    }

    override var isSelected: Bool {
        didSet {
            if isEditing {
                checkImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
}
