//
//  AddItemView.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addItemVM: AddItemViewModel
    init(vm: AddItemViewModel) {
        self.addItemVM = vm
    }
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                }
                .frame(height: 50)
                Spacer()
            }.padding(.horizontal,20)
            Form {
                TextField(Constants.enterName, text: $addItemVM.name)
                TextField(Constants.enterPrice, text: $addItemVM.price)
                Button(Constants.save) {
                    addItemVM.saveItem()
                    presentationMode.wrappedValue.dismiss()
                }
                .centerHorizontally()
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        AddItemView(vm: AddItemViewModel(dataRepo: ItemsDataRepository(context: viewContext)))
    }
}
