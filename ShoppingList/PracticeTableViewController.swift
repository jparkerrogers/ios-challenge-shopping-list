//
//  PracticeTableViewController.swift
//  ShoppingList
//
//  Created by Jonathan Rogers on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PracticeTableViewController: UITableViewController {
    
    var friendArray: [String] = ["Jordan","Kedo","Tyler","Jake","Mason","Kedo"]
    var invitedArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
            return "Invited"
        } else {
            return "Not Invited"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return invitedArray.count
        } else {
            return friendArray.count
        }
        
    }
    
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! PracticeTableViewCell
     
        if indexPath.section == 0 {
            let friend = invitedArray[indexPath.row]
            cell.friendNameLabel.text = friend
            cell.delegate = self
        } else {
            let friend = friendArray[indexPath.row]
            cell.friendNameLabel.text = friend
            cell.delegate = self
        }
     
     return cell
     }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension PracticeTableViewController: PracticeTableViewCellDelegate {
    
    func practiceTableViewCellButtonTapped(sender: PracticeTableViewCell) {
        
        if let indexPath = tableView.indexPathForCell(sender) {
            if indexPath.section == 0 {
                let friend = invitedArray[indexPath.row]
                
            } else {
                for friend in friendArray {
                    invitedArray.append(friend)
                    print(invitedArray)
                }
            }
        }
    }
}




