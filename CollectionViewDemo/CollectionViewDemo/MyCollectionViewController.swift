//
//  MyCollectionViewController.swift
//  CollectionViewDemo
//
//  Created by 北田晴佳 on 2018/06/01.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    var photos = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10"]
    
    @IBAction func addItem() {
        photos.append("👻")
        //self.collectionView?.reloadData() // Animation
        
        let index = IndexPath.init(row: photos.count - 1, section: 0)
        collectionView?.insertItems(at: [index])
    }
    
    @IBAction func deleteSelected() {
        if let selected = collectionView?.indexPathsForSelectedItems {
            let items = selected.map {$0.item}.sorted().reversed()
            for item in items {
                photos.remove(at: item)
            }
            collectionView?.deleteItems(at: selected)
            navigationController?.isToolbarHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        let width = view.frame.width / 3 - 10
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize.init(width: width, height: width)
        
        // refresh control
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        collectionView?.refreshControl = refresh
        
        navigationItem.leftBarButtonItem = editButtonItem
        //navigationController?.isToolbarHidden = false
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        // disable add btn
        addBtn.isEnabled = !editing
        collectionView?.allowsMultipleSelection = editing
        let indices = collectionView?.indexPathsForVisibleItems
        for index in indices! {
            let cell = collectionView?.cellForItem(at: index) as! MyCollectionViewCell
            cell.isEditing = editing
        }
        if !editing {
            navigationController?.isToolbarHidden = true
        }
    }
    
    @objc func refresh() {
        addItem()
        // finish refreshControl()
        collectionView?.refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.nameLabel.text = photos[indexPath.row]
        cell.isEditing = isEditing
        // Configure the cell
    
        return cell
    }
    
    // selected item
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing {
            //performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)()
            //performSegue(withIdentifier: "detail", sender: indexPath)
        } else {
            navigationController?.isToolbarHidden = false
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isEditing {
            if let selected = collectionView.indexPathsForSelectedItems {
                navigationController?.isToolbarHidden = true
            }
        }
    }

}
