//
//  FavoritesViewModel.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import Foundation
import Combine
import SwiftData

class FavoritesViewModel: ObservableObject {
    
    @Published var favoriteCats: [FavoriteCat] = []
    
    private var modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    func isFavorite(catId: UUID) -> Bool {
        return favoriteCats.contains { $0.id == catId }
    }
}
