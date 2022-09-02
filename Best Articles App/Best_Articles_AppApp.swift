//
//  Best_Articles_AppApp.swift
//  Best Articles App
//
//  Created by Bohdan Zhyzhchenko on 02.09.2022.
//

import SwiftUI

@main
struct Best_Articles_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
