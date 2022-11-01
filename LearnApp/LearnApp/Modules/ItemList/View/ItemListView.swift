//
//  ContentView.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 29/10/22.
//

import SwiftUI
import CoreData

struct ItemListView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var itemListVM: ItemListViewModel
    @State private var isPresented: Bool = false
    init(viewModel: ItemListViewModel) {
        self.itemListVM = viewModel
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(itemListVM.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .sheet(isPresented: $isPresented, content: {
               AddItemView(vm: AddItemViewModel(dataRepo: ItemsDataRepository(context: viewContext)))
            })
            .navigationTitle(Constants.listTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(Constants.addItem) {
                        isPresented.toggle()
                    }
                }
            }
        }
    }
    private func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = itemListVM.items[index]
            itemListVM.deleteItem(itemID: item.id)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        ItemListView(viewModel: ItemListViewModel(dataRepo: ItemsDataRepository(context: viewContext)))
    }
}
