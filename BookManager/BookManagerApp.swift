//
//  BookManagerApp.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI
import SwiftData

@main
struct BookManagerApp: App {
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: PersistentBook.self)
        } catch {
            // Schema changed during development — delete old store and retry
            let defaultURL = URL.applicationSupportDirectory
                .appending(path: "default.store")
            try? FileManager.default.removeItem(at: defaultURL)

            do {
                container = try ModelContainer(for: PersistentBook.self)
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
