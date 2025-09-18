//
//  CoreDataManager.swift
//  CoreDataTodoList
//
//  Created by Alimullah on 13/9/25.
//


import Foundation
import CoreData
import UIKit


struct ToDoModel{
    var id: UUID
    var name: String
    var createdAt: Date
    var orderIndex: Int64
}


final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    // Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataTodoList")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("✅ Context Saved")
            } catch {
                print("❌ Failed to save context: \(error)")
            }
        }
    }
    
    // Create
    func createItem(model: ToDoModel) {
        let newItem = ToDoEntity(context: context)
        newItem.id = model.id
        newItem.name = model.name
        newItem.createdAt = model.createdAt
        newItem.orderIndex = model.orderIndex
        saveContext()
    }
    
    // Read
    func fetchAllItems() -> [ToDoModel] {
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        let sort = NSSortDescriptor(key: "orderIndex", ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            let entities = try context.fetch(request)
            return entities.compactMap { entity in
                guard let id = entity.id,
                      let name = entity.name,
                      let createdAt = entity.createdAt else { return nil }
                return ToDoModel(id: id, name: name, createdAt: createdAt, orderIndex: entity.orderIndex)
            }
        } catch {
            print("❌ Failed to fetch items: \(error)")
            return []
        }
    }
    
    // Update
    func updateItem(model: ToDoModel) {
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", model.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                entity.name = model.name
                entity.orderIndex = model.orderIndex
                saveContext()
            }
        } catch {
            print("❌ Failed to update: \(error)")
        }
    }
    
    // Delete
    func deleteItem(model: ToDoModel) {
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", model.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch {
            print("❌ Failed to delete: \(error)")
        }
    }
    
    // Bulk Update OrderIndex
    func updateOrder(for models: [ToDoModel]) {
        for model in models {
            let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", model.id as CVarArg)
            
            if let entity = try? context.fetch(request).first {
                
                entity.orderIndex = model.orderIndex
            }
        }
        saveContext()
    }
}
