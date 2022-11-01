//
//  ViewModel.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import CoreData
@MainActor
class ItemListViewModel: NSObject, ObservableObject {
    @Published var items = [ItemModel]()
    private var dataRepo: ItemsDataRepository
    private let fetchResultsController: NSFetchedResultsController<Item>
    init(dataRepo: ItemsDataRepository) {
        self.dataRepo = dataRepo
        let context = CoreDataManager.shared.persistentStoreContainer.viewContext
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: Item.all,
                                                                 managedObjectContext: context,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
        super.init()
        self.fetchResultsController.delegate = self
        do {
            try fetchResultsController.performFetch()
            guard let items = fetchResultsController.fetchedObjects else { return }
            self.items = items.map(ItemModel.init)
        } catch {
            debugPrint(error)
        }
    }
    func deleteItem(itemID: NSManagedObjectID) {
        self.dataRepo.deleteItem(itemId: itemID)
    }
}
extension ItemListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let items = controller.fetchedObjects as? [Item] else {
            return
        }
        self.items = items.map(ItemModel.init)
    }
}
