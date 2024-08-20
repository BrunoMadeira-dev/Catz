//
//  CatzDismissButton.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import SwiftUI

struct CatzDismissButton: View {
    @Binding var isShowingDetailedView: Bool
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isShowingDetailedView = false
            },
            label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 45, height: 45)
            })
        }
        .padding()
    }
}

#Preview {
    CatzDismissButton(isShowingDetailedView: .constant(true))
}
