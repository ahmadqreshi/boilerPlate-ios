//
//  Item+Entensions.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import CoreData

extension Item: BaseModel {
    static var all: NSFetchRequest<Item> {
        let request = Item.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
