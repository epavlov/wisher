//
//  Item+CoreDataClass.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/18/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    // every time item is inserted, we call this function
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        // setting timestamp
        self.created = NSDate()
    }
}
