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
    
    @IBAction func addNewToDo(sender: AnyObject) {
        
        let returnedArray = NSUserDefaults.standardUserDefaults().objectForKey("arrayMasterList")! as! NSArray
        returnedArray.append(newToDoItem.text)
        
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
        //this closes the keyboard
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }



}

