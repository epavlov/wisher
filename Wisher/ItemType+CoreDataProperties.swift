//
//  ItemType+CoreDataProperties.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/15/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
