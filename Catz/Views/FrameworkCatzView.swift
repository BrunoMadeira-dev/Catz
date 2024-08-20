//
//  FrameworkCatzView.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import SwiftUI
import SwiftData

struct FrameworkCatzView: View {
    
    @State var title: String
    @State var image: String?
    @State var id: String?
    
    var breeds: CatBreed
    
    @Query private var favoriteCats: [FavoriteCat]
    @State private var favoriteIDs: Set<String> = []
    
    var body: some View {
        VStack(spacing: 20) {
            if let _ = image, let url = URL(string: image ?? "") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100, maxHeight: 100)
                } placeholder: {
                    ProgressView()
                }
            } else if let _ = image {
                Image(systemName: "cat.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            VStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .scaledToFit()
                    .layoutPriority(1)
                    .minimumScaleFactor(0.6)
                
                Image(systemName: favoriteIDs.contains(breeds.name) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .padding(.top, 5)
            }
        }
        .padding()
        .onAppear {
            updateFavoriteIDs()
        }
    }
    
    private func updateFavoriteIDs() {
        favoriteIDs = Set(favoriteCats.map { $0.name })
    }
}

#Preview {
    FrameworkCatzView(title: "teste grande de nome", image: "cat.fill", breeds: CatBreed(id: "teste", name: "teste", imageURL: "cat.fill", origin: "teste", temperament: "teste", catDescription: "Cat that lives a long long life", lifespanRange: "10-15"))
}
