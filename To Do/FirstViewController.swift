//
//  FirstViewController.swift
//  To Do
//
//  Created by Jamie Garner on 30/01/2016.
//  Copyright © 2016 Jamie Garner. All rights reserved.
//

import UIKit

//global vars accessible across multiple View Controllers
var toDoList = [String]()
//var toDoList = ["Put Bins Out", "Empty Dishwasher", "Buy Milk"]


class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableListOfToDoItems: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            if NSUserDefaults.standardUserDefaults().objectForKey("arrayMasterList") != nil {
                toDoList = NSUserDefaults.standardUserDefaults().objectForKey("arrayMasterList") as! [String]
            }
        }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDoList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //to get the row ID you need to use indexPath.row
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            //Stating that the arrayMasterList is the same as toDoList
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "arrayMasterList")
            tableListOfToDoItems.reloadData()
        }
    }
    
    

    
    override func viewDidAppear(animated: Bool) {
        tableListOfToDoItems.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

