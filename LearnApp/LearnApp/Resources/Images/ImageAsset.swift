//
//  ImageAsset.swift
//  LearnApp
//
//  Created by Ahmad Qureshi on 29/10/22.
//

import Foundation
import SwiftUI

enum ImageAsset : String {
    case demoImage
    var set : Image? {
        return Image(self.rawValue)
    }
}
