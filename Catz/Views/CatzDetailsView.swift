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
    
    var body: some View {
        VStack {
            CatzDismissButton(isShowingDetailedView: $isShowingDetailedView)
            Spacer()
            FrameworkCatzView(title: breeds.name, image: breeds.imageURL)
            Text(breeds.catDescription)
                .font(.body)
                .padding()
            Spacer()
            
            Button(action: {
                
            }, label: {
                CatzFavBtn(title: "Favorite")
                
            })
            
            
        }
    }
}

#Preview {
    CatzDetailsView(isShowingDetailedView: .constant(true), breeds: CatBreed(id: "teste", name: "teste", imageURL: "cat.fill", origin: "teste", temperament: "teste", catDescription: "Cat that lives a long long life", lifespanRange: "10-15"))
}
