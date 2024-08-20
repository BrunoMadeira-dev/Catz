//
//  FavouriteBreedsView.swift
//  Catz
//
//  Created by Bruno Madeira on 13/08/2024.
//

import SwiftUI
import SwiftData

struct FavouriteBreedsView: View {
    @Query private var favoriteCats: [FavoriteCat]
    @State private var favoriteIDs: Set<UUID> = []
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack {
            if favoriteCats.isEmpty {
                VStack {
                    Text("No favorite cats yet.")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                }
                .navigationTitle("Favorites Catz")
            } else {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(favoriteCats) { cat in
                            VStack {
                                if let imageURL = URL(string: cat.imageUrl) {
                                    AsyncImage(url: imageURL) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                    }
                                } else {
                                    Image(systemName: "cat.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                VStack {
                                    Text(cat.name)
                                        .font(.headline)
                                        .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                    
                                    Image(systemName: favoriteIDs.contains(cat.id) ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                        .padding(.top, 5)
                                }
                                
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Favorites Catz")
        .onAppear {
            updateFavoriteIDs()
        }
    }
    
    private func updateFavoriteIDs() {
        favoriteIDs = Set(favoriteCats.map { $0.id })
    }
}

#Preview {
    FavouriteBreedsView()
}
