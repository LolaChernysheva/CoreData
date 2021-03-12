//
//  Meal+CoreDataProperties.swift
//  MealTime
//
//  Created by Лолита on 12.03.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var date: Date?
    @NSManaged public var user: User?

}
