//
//  ToDoEntity+CoreDataProperties.swift
//  CoreDataTodoList
//
//  Created by Alimullah on 13/9/25.
//
//

import Foundation
import CoreData


extension ToDoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var orderIndex: Int64

}

extension ToDoEntity : Identifiable {

}
