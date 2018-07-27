//
//  MyTableViewController.swift
//  TableViewDemo
//
//  Created by 北田晴佳 on 2018/05/25.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    static var students = ["Lucas", "Keisuke", "Junpei", "Elif", "Haruka",
                            "Ayako", "Hunter", "Alex", "Jessica", "Ryuma",
                            "Miho", "Cadiz", "Dexun"]
    static var position = ["Developer", "Developer", "Developer", "Designer", "Developer",
                          "Developer", "Developer", "Developer", "Designer", "Developer",
                          "Developer", "Designer", "Developer"]
    //private var selectedCell: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView: TableView Objects in ViewContoroller
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
    }
    
    // MARK - UITableViewDataSource
    // how many sections?
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // how many rows?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyTableViewController.students.count
    }
    
    // What to display?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        //cell.faceImage = UIImageView(image: UIImage.in)
        cell.label1.text = MyTableViewController.students[indexPath.row]
        cell.label2.text = MyTableViewController.position[indexPath.row]
        //cell.textLabel?.text = students[indexPath.row]
        // Configure the cell...
        return cell
    }
    
    // MARK: UITableViewDelegate
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedCell = indexPath.row
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let detailVC = segue.destination as? DetailViewController, let index = tableView.indexPathForSelectedRow  {
                detailVC.name = MyTableViewController.students[index.row]
                detailVC.posi = MyTableViewController.position[index.row]
            }
        }
        
    }


}
