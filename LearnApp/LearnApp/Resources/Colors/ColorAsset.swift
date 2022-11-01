//
//  ColorAsset.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 29/10/22.
//

import Foundation
import SwiftUI

enum ColorAsset: String {
    case demoColor
    var set : Color? {
        return Color(self.rawValue)
    }
}
