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
                Image(systemName: "star.fill")
                    .padding(.top, 5)
            }
        }
        .padding()
    }
}

#Preview {
    FrameworkCatzView(title: "teste grande de nome", image: "cat.fill")
}
