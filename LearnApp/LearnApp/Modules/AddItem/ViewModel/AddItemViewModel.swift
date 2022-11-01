//
//  AddItemViewModel.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import CoreData

class AddItemViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var price: String = ""
    private var dataRepo: ItemsDataRepository

    init(dataRepo: ItemsDataRepository) {
        self.dataRepo = dataRepo
    }
    func saveItem() {
        dataRepo.save(name: name,price: price)
    }
}
