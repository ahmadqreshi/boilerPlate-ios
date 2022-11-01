//
//  View+Extensions.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 31/10/22.
//

import Foundation
import SwiftUI

extension View {
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
