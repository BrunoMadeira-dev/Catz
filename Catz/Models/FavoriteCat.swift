//
//  FavoriteCat.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import Foundation
import SwiftData

@Model
class FavoriteCat: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var imageUrl: String
    var catDescription: String
    
    init(name: String, imageUrl: String, catDescription: String) {
            self.id = UUID()
            self.name = name
            self.imageUrl = imageUrl
            self.catDescription = catDescription
        }
}
