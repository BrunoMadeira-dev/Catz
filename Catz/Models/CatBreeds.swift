//
//  CatBreeds.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import Foundation
import SwiftData

@Model
class CatBreed: Identifiable {
    var idCat: UUID
    var id: String
    var name: String
    var imageURL: String
    var origin: String
    var temperament: String
    var catDescription: String
    var lifespanRange: String
    var isFavourite: Bool

    // Inicializador explícito necessário para SwiftData
    init(idCat: UUID = UUID(),
         id: String,
         name: String,
         imageURL: String,
         origin: String,
         temperament: String,
         catDescription: String,
         lifespanRange: String,
         isFavourite: Bool = false) {
        self.idCat = idCat
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.origin = origin
        self.temperament = temperament
        self.catDescription = catDescription
        self.lifespanRange = lifespanRange
        self.isFavourite = isFavourite
    }
}
