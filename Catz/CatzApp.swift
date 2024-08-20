//
//  CatzApp.swift
//  Catz
//
//  Created by Bruno Madeira on 13/08/2024.
//

import SwiftUI
import SwiftData

@main
struct CatzApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CatBreed.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                CatBreedsView()
                    .tabItem {
                        Label("Breeds", systemImage: "pawprint")
                    }
                FavouriteBreedsView()
                    .tabItem {
                        Label("Favourites", systemImage: "star.fill")
                    }
            }
            //ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
