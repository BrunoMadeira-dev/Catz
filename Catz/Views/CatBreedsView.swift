//
//  CatBreedsView.swift
//  Catz
//
//  Created by Bruno Madeira on 13/08/2024.
//

import SwiftUI
import SwiftData

struct CatBreedsView: View {
    
    @State private var seacrhBar: String = ""
    @StateObject var viewModel = FrameworkGridViewModel()
    @StateObject var viewModelCalls = CatzBreedsViewModel()
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            
            ZStack {
//                if viewModelCalls.isLoading {
//                    ProgressView("Loading Cats...")
//                        .progressViewStyle(CircularProgressViewStyle())
//                        .scaleEffect(2.0)  // Aumenta o tamanho do ProgressView
//                } else {
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns) {
                            ForEach(viewModelCalls.filteredBreeds) { breeds in
                                FrameworkCatzView(title: breeds.name, image: breeds.imageURL)
                                    .onTapGesture {
                                        viewModel.selectedFramework = breeds
                                    }
                            }
                        }
                    }
                    .navigationTitle("Cats")
                    .searchable(text: $seacrhBar, placement: .automatic, prompt: "Search Cats")
                    .onAppear(
                        perform: viewModelCalls.fetchBreeds
                    )
                    .onChange(of: seacrhBar) { _, newValue in
                        viewModelCalls.searchBreeds(with: newValue)
                    }
                //}
            }
        }
    }
}

#Preview {
    CatBreedsView()
}
