//
//  FirstViewController.swift
//  To Do
//
//  Created by Jamie Garner on 30/01/2016.
//  Copyright © 2016 Jamie Garner. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate {
    var arrayToDo = ["Put Bins Out", "Empty Dishwasher", "Buy Milk"]

    
    @IBOutlet var tableListOfToDoItems: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            if userAlreadyExist("arrayMasterList") == false
            {
                 NSUserDefaults.standardUserDefaults().setObject(arrayToDo, forKey: "arrayMasterList")
            }
        }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        let returnedArray = NSUserDefaults.standardUserDefaults().objectForKey("arrayMasterList")! as! NSArray
        return returnedArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        //to get the row ID you need to use indexPath.row
        let returnedArray = NSUserDefaults.standardUserDefaults().objectForKey("arrayMasterList") as! NSArray
        cell.textLabel?.text = returnedArray[indexPath.row] as! String
        return cell
    }
    
    
    func userAlreadyExist(kUsernameKey: String) -> Bool {
        return NSUserDefaults.standardUserDefaults().objectForKey(kUsernameKey) != nil
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

