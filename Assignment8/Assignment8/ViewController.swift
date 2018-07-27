//
//  ViewController.swift
//  Assignment8
//
//  Created by 北田晴佳 on 2018/06/11.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    @IBOutlet weak var taskTableView: UITableView!
    private let segueEditTaskViewController = "SegueEditTaskViewController"
    
    // MARK: - Properties for table view
    var tasks:[Task] = []
    var taskToShow:[String:[String]] = ["Todo": [], "Shopping": [], "Assignment": []]
    let taskCategories:[String] = ["Todo", "Shopping", "Assignment"]
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        
        taskTableView.reloadData()
    }
    
    // MARk: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? AddTaskViewController else {
            return
        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        destinationViewController.context = context
        
        if let indexPath = taskTableView.indexPathForSelectedRow, segue.identifier == segueEditTaskViewController {
            let editedCategory = taskCategories[indexPath.section]
            let editedName = taskToShow[editedCategory]?[indexPath.row]
            
            let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name = %@ and category = %@", editedName!, editedCategory)
            do {
                let task = try context.fetch(fetchRequest)
                destinationViewController.task = task[0]
            } catch {
                print("Fetching Failed.")
            }
        }
    }
    
    // MARK: - Method of Getting data from Core Data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
            tasks = try context.fetch(fetchRequest)
            
            for key in taskToShow.keys {
                taskToShow[key] = []
            }
            
            for task in tasks {
                taskToShow[task.category!]?.append(task.name!)
            }
        } catch {
            print("Fetching Failed.")
        }
    }
    
    // MARK: - Table View Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return taskCategories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return taskCategories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskToShow[taskCategories[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = taskTableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? TaskTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        
        let sectionData = taskToShow[taskCategories[indexPath.section]]
        let cellData = sectionData?[indexPath.row]
        
        cell.taskLabel.text = "\(cellData!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let deleteCategory = taskCategories[indexPath.section]
            let deletedName = taskToShow[deleteCategory]?[indexPath.row]
            
            let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name = %@ and category = %@", deletedName!, deleteCategory)
            
            do {
                let task = try context.fetch(fetchRequest)
                context.delete(task[0])
            } catch {
                print("Fetching Failed.")
            }
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            getData()
        }
        
        taskTableView.reloadData()
    }
}

