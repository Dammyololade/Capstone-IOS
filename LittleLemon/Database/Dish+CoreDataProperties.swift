//
//  Dish+CoreDataProperties.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 20.08.23.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
    @NSManaged public var descriptionInfo: String?

}

extension Dish : Identifiable {
    
    static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    class func deleteAll(_ context: NSManagedObjectContext) {
        let request = Dish.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistenStoreCordinator = context.persistentStoreCoordinator else { return }
            try persistenStoreCordinator.execute(deleteRequest, with: context)
            save(context)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    static func exists(name: String,
                       _ context:NSManagedObjectContext) -> Bool? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", name)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish]
            else {
                return nil
            }
            return results.count > 0
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
    
    static func save(_ context: NSManagedObjectContext) {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Unresolved error \(error),  \(error.userInfo)")
        }
    }
    
    class func readAll(_ context:NSManagedObjectContext) -> [Dish]? {
        let request = Dish.request()
        do {
            guard let results = try context.fetch(request) as? [Dish],
                  results.count > 0 else { return nil }
            return results
        } catch (let error){
            print(error.localizedDescription)
            return nil
        }
    }


}

extension Dish {
    
    static func createDishFromMenu(items: [MenuItem], _ context: NSManagedObjectContext) {
        for menu in items {
            print(menu.image)
            guard let _ = exists(name: menu.title, context) else {
               continue
            }
            let dish = Dish(context: context)
            dish.title = menu.title
            dish.price = menu.price
            dish.category = menu.category
            dish.image = menu.category
            dish.descriptionInfo = menu.description
        }
        
        save(context)
    }
}
