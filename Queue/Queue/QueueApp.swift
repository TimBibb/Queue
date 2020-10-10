//
//  QueueApp.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI

@main
struct QueueApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
