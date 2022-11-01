//
//  LearnAppApp.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 29/10/22.
//

import SwiftUI

@main
struct LearnAppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ItemListView(viewModel: ItemListViewModel(dataRepo: ItemsDataRepository(context: viewContext)))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
