//
//  CatzFavBtn.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import SwiftUI

struct CatzFavBtn: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    CatzFavBtn(title: "Test Button")
}
