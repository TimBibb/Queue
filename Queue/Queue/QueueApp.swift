//
//  QueueApp.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI
import Firebase

@main
struct QueueApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(session: SessionStore.init())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
