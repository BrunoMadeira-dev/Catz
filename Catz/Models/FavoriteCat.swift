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
    var lifeSpan: String
    var origin: String
    var temperament: String
    
    init(name: String, imageUrl: String, catDescription: String, lifeSpan: String, origin: String, temperament: String) {
        self.id = UUID()
        self.name = name
        self.imageUrl = imageUrl
        self.catDescription = catDescription
        self.lifeSpan = lifeSpan
        self.origin = origin
        self.temperament = temperament
    }
}
