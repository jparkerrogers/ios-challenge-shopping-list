//
//  ItemController.swift
//  ShoppingList
//
//  Created by Jonathan Rogers on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    
    static let sharedController = ItemController()
    
    var allItems: [Item] {
        let request = NSFetchRequest(entityName: "Item")
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Item]
        } catch {
            return []
        }
    }
    
    var foundItems: [Item] {
        
        return allItems.filter({ $0.itemFound.boolValue })
    }
    
    var itemsToFind: [Item] {
        
        return allItems.filter({ !$0.itemFound.boolValue })
    }
    
    func addItem(item: Item) {
        
        saveToPersistentStorage()
    }
    
    func removeItem(item: Item) {
        
        item.managedObjectContext?.deleteObject(item)
    }
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("unable to save Item")
        }
        
    }
}
