//
//  MyCollectionViewController.swift
//  Assignment7
//
//  Created by 北田晴佳 on 2018/05/30.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CardCell"

class MyCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var segmentCont: UISegmentedControl!
    
    var section1 = [["image1","image2"],
                    ["image3","image4"],
                    ["image5"]]
    var section2 = [["image6","image7"],
                    ["image8","image9"],
                    ["image10"]]
    
    var sectionName1 = ["food", "event", "family"]
    var sectionName2 = ["vacouver", "tronto", "calgary"]
    
    var data: [[String]]?
    var selectName: [String]?
    
    var selectedLabel = "Subject"
    
    var photos = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10"]
    var labels = ["Subject", "Location"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        data = section1
        selectName = sectionName1
        
        // Segment controller
        segmentCont.setTitle(labels[0], forSegmentAt: 0)
        segmentCont.setTitle(labels[1], forSegmentAt: 1)
        
        segmentCont.addTarget(self, action: #selector(changeVal(sender:)), for: .valueChanged)
        
        // double tap gesture
        let doubleTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                                   action: #selector(didDoubleTapCollectionView(gesture:)))
        
        doubleTapGesture.numberOfTapsRequired = 2  // add double tap
        self.collectionView?.addGestureRecognizer(doubleTapGesture)

        // Do any additional setup after loading the view.
    }
    
    @objc func changeVal(sender: UISegmentedControl) {
        let selectedItem = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        //segment.titleForSegment(at: segment.selectedSegmentIndex)
        selectedLabel = selectedItem
        if selectedItem == "Location" {
            data = section2
            selectName = sectionName2
        } else {
            data = section1
            selectName = sectionName1
        }
        self.collectionView?.reloadData()
    }
    
    @objc func didDoubleTapCollectionView(gesture: UITapGestureRecognizer) {
        //photos.remove(at: sourceIndexPath.item)
        if gesture.state == .ended {
            if let indexPath = self.collectionView?.indexPathForItem(at: gesture.location(in: self.collectionView)) {
                //let cell = self.collectionView?.cellForItem(at: indexPath)
                if selectedLabel == "Location" {
                    section2[indexPath.section].remove(at: indexPath.row)
                } else {
                    section1[indexPath.section].remove(at: indexPath.row)
                }
                data![indexPath.section].remove(at: indexPath.row)
                self.collectionView?.deleteItems(at: [indexPath])
                print("you can do something with the cell or index path here \(photos)")
            } else {
                print("collection view was tapped")
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return selectName!.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data![section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        //print("index: \(indexPath.row)")
        cell.photo.image = fetchImage(Bundle.main.url(forResource: data![indexPath.section][indexPath.row], withExtension: "JPG"))
    
        return cell
    }
    
    private func fetchImage(_ imageURL: URL?) -> UIImage?{
        if let url = imageURL {
            let urlContent = try? Data(contentsOf: url)
            if let imageData = urlContent {
                return UIImage(data: imageData)
            }
            
        }
        return nil
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeader", for: indexPath) as? MyCollectionReusableView else {
            fatalError("Could not find proper header")
        }
        
        if kind == UICollectionElementKindSectionHeader {
            header.label1.text = selectName![indexPath.section]
            return header
        }
        
        return UICollectionReusableView()
    }

}
