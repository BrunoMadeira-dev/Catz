//
//  CatBreedsView.swift
//  Catz
//
//  Created by Bruno Madeira on 13/08/2024.
//

import SwiftUI

struct CatBreedsView: View {
    
    @State private var seacrhBar: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Cat Breeds View")
                
            }
            .navigationTitle("Cats")
            .searchable(text: $seacrhBar, placement: .automatic, prompt: "Search Cats")
        }
    }
}

#Preview {
    CatBreedsView()
}
