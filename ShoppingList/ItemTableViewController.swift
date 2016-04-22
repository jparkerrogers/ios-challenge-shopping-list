//
//  ItemTableViewController.swift
//  ShoppingList
//
//  Created by Jonathan Rogers on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var itemTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Items To Find"
        } else {
            return "Items In Cart"
        }
    }
    
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return ItemController.sharedController.itemsToFind.count
        } else {
            return ItemController.sharedController.foundItems.count
        }
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        
        showAlert()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ItemTableViewCell

        let item = handleItemsStatus(indexPath)
        
        cell.updateWith(item)
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let item = handleItemsStatus(indexPath)
            
            ItemController.sharedController.removeItem(item)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Add an item!", message: nil, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Add", style: .Default) { (action) in
            
            if let textField = alert.textFields?.first {
                let newItem = Item(name: textField.text!)
                
                ItemController.sharedController.addItem(newItem)
                
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(action)
        
        let action1 = UIAlertAction(title: "Cancel", style: .Default) { (cancel) in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(action1)
        
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Add item here"
        }
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
}


extension ItemTableViewController: ItemTableViewCellDelegate {
    
    // call the required function
    
    func buttonTableViewCellTapped(sender: ItemTableViewCell) {
        
        let indexPath = tableView.indexPathForCell(sender)!
        
        let item = handleItemsStatus(indexPath)
        
        item.itemFound = !item.itemFound.boolValue
        
        tableView.reloadData()
        
    }
    
    func handleItemsStatus(indexPath: NSIndexPath) -> Item {
        
        if indexPath.section == 0 {
            return ItemController.sharedController.itemsToFind[indexPath.row]
        } else {
            return ItemController.sharedController.foundItems[indexPath.row]
        }
    }
}

















