//
//  FrameworkCatzView.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import SwiftUI

struct FrameworkCatzView: View {
    
    @State var title: String
    @State var image: String?
    var imageURL: String?
    //let framework: Framework
    
    var body: some View {
        VStack(spacing: 20) {
            if let imageURL = image, let url = URL(string: image ?? "") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100, maxHeight: 100)
                } placeholder: {
                    ProgressView()
                }
            } else if let image = image {
                Image(systemName: "cat.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                Image(systemName: "star.fill")
            }
        }
    }
}

#Preview {
    FrameworkCatzView(title: "teste", image: "cat.fill")
}
