//
//  swiftMemoApp.swift
//  swiftMemo
//
//  Created by HoHocompany on 2023/02/01.
//

import SwiftUI

@main
struct swiftMemoApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
