//
//  DataRepository.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import CoreData

class ItemsDataRepository {
    private (set) var context: NSManagedObjectContext
    private let fetchResultsController: NSFetchedResultsController<Item>
    init(context: NSManagedObjectContext) {
        self.context = context
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: Item.all,
                                                                 managedObjectContext: context,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
    }
    func fetchData() -> [ItemModel] {
        var item = [ItemModel]()
        do {
            try fetchResultsController.performFetch()
            guard let items = fetchResultsController.fetchedObjects else { return []}
            item = items.map(ItemModel.init)
        } catch {
            debugPrint(error)
        }
        return item
    }
    func deleteItem(itemId: NSManagedObjectID) {
        do {
            guard let item = try context.existingObject(with: itemId) as? Item else {
                return
            }
            try item.delete()
        }
        catch {
            debugPrint(error)
        }
    }
    func save(name: String, price: String) {
        do {
            let item = Item(context: context)
            item.name = name
            item.price = price
            try item.save()
        } catch {
            debugPrint(error)
        }
    }
}
