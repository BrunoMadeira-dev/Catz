//
//  CatzDetailsView.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import SwiftUI
import SwiftData

struct CatzDetailsView: View {

    @Binding var isShowingDetailedView: Bool
    var breeds: CatBreed
    
    @Environment(\.modelContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @Query private var favoriteCats: [FavoriteCat]
    @State private var favoriteIDs: Set<String> = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                CatzDismissButton(isShowingDetailedView: $isShowingDetailedView)
                Spacer()
                FrameworkCatzView(title: breeds.name, image: breeds.imageURL, breeds: breeds)
                Text(breeds.catDescription)
                    .font(.body)
                    .padding()
                Text("Temperament: \(breeds.temperament)")
                Text("Origin: \(breeds.origin)")
                Text("Life Span: \(breeds.lifespanRange)")
                Spacer()
                
                VStack {
                    if favoriteIDs.contains(breeds.name) {
                        Button(action: {
                            deleteFavorite(breedName: breeds.name)
                            dismiss()
                        }, label: {
                            CatzFavBtn(title: "Remove Favorite")
                        })
                        .padding(.top, 10)
                    } else {
                        Button(action: {
                            saveFavorite()
                            dismiss()
                        }, label: {
                            CatzFavBtn(title: "Favorite")
                        })
                    }
                }
            }
            .onAppear {
                updateFavoriteIDs()
            }
        }
    }
    
    private func updateFavoriteIDs() {
        favoriteIDs = Set(favoriteCats.map { $0.name })
    }
    
    private func saveFavorite() {
        let newFavorite = FavoriteCat(name: breeds.name, imageUrl: breeds.imageURL, catDescription: breeds.catDescription, lifeSpan: breeds.lifespanRange, origin: breeds.origin, temperament: breeds.temperament)
        
        viewContext.insert(newFavorite)
        
        do {
            if viewContext.hasChanges {
                try viewContext.save()
                print("Saved to favorites")
            }
        } catch {
            print("Failed to save favorite: \(error.localizedDescription)")
        }
    }
    
    private func deleteFavorite(breedName: String) {
        if let favoriteCat = favoriteCats.first(where:  {$0.name == breedName}) {
            viewContext.delete(favoriteCat)
        }
        do {
            if viewContext.hasChanges {
                try viewContext.save()
                updateFavoriteIDs()
                print("Deleted Successfuly!")
            }
        } catch {
            print("Failed to delete favorite: \(error.localizedDescription)")
        }

    }
}

#Preview {
    CatzDetailsView(isShowingDetailedView: .constant(true), breeds: CatBreed(id: "teste", name: "teste", imageURL: "cat.fill", origin: "teste", temperament: "teste", catDescription: "Cat that lives a long long life", lifespanRange: "10-15"))
}
