//
//  CoreDataManager.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import CoreData

struct CoreDataManager {
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "LearnApp")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize core data \(error)")
            }
        }
    }
}
