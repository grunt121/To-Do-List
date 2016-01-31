//
//  SecondViewController.swift
//  To Do
//
//  Created by Jamie Garner on 30/01/2016.
//  Copyright © 2016 Jamie Garner. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var newToDoItem: UITextField!
    
    @IBAction func addNewItem(sender: AnyObject) {
        toDoList.append(newToDoItem.text!)
        newToDoItem.text = ""
        //Stating that the arrayMasterList is the same as toDoList
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "arrayMasterList")

    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
        
    {
        //this closes the keyboard by touching outside the area
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        newToDoItem.resignFirstResponder()
        return true
    }



}

