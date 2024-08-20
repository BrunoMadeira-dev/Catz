//
//  CatzDetailsView.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import SwiftUI

struct CatzDetailsView: View {

    @Binding var isShowingDetailedView: Bool
    var breeds: CatBreed
    
    @Environment(\.modelContext) private var viewContext
    
    var body: some View {
        VStack {
            CatzDismissButton(isShowingDetailedView: $isShowingDetailedView)
            Spacer()
            FrameworkCatzView(title: breeds.name, image: breeds.imageURL, breeds: breeds)
            Text(breeds.catDescription)
                .font(.body)
                .padding()
            Spacer()
            
            Button(action: {
                saveFavorite()
            }, label: {
                CatzFavBtn(title: "Favorite")
                
            })
            
            
        }
    }
    
    private func saveFavorite() {
        let newFavorite = FavoriteCat(name: breeds.name, imageUrl: breeds.imageURL, catDescription: breeds.catDescription)
        
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
}

#Preview {
    CatzDetailsView(isShowingDetailedView: .constant(true), breeds: CatBreed(id: "teste", name: "teste", imageURL: "cat.fill", origin: "teste", temperament: "teste", catDescription: "Cat that lives a long long life", lifespanRange: "10-15"))
}
