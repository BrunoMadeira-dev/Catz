//
//  Item.swift
//  Catz
//
//  Created by Bruno Madeira on 13/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
