//
//  Item.swift
//  ShoppingList
//
//  Created by Jonathan Rogers on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

import Foundation
import CoreData


class Item: NSManagedObject {
    
    convenience init(name: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.itemFound = false
    }
}