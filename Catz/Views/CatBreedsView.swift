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
    
    @State private var selectedBreed: CatBreed? = nil
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                    ScrollView {
                        LazyVGrid(columns: viewModel.columns) {
                            ForEach(viewModelCalls.filteredBreeds) { breeds in
                                FrameworkCatzView(title: breeds.name, image: breeds.imageURL)
                                    .onTapGesture {
                                        viewModelCalls.selectedFramework = breeds
                                        self.selectedBreed = breeds
                                        print(breeds.name)
                                        
                                        
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
                    .sheet(isPresented: $viewModelCalls.isShowingDetailView) {
                        CatzDetailsView(isShowingDetailedView: $viewModelCalls.isShowingDetailView, breeds: selectedBreed!)
                    }
            }
        }
    }
}

#Preview {
    CatBreedsView()
}
