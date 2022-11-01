//
//  ItemModel.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import CoreData

struct ItemModel: Identifiable {
    private var item: Item
    init(item: Item) {
        self.item = item
    }
    var id: NSManagedObjectID {
        item.objectID
    }
    var name: String {
        item.name ?? ""
    }
    var price: String {
        item.price ?? ""
    }
}
