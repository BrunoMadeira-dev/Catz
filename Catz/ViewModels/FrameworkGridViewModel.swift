//
//  FrameworkGridViewModel.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: CatBreed? {
        didSet { isShowingDetailView = true }
    }
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
}
