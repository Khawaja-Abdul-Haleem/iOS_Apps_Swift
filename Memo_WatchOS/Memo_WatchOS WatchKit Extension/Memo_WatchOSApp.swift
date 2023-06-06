//
//  Memo_WatchOSApp.swift
//  Memo_WatchOS WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import SwiftUI

@main
struct Memo_WatchOSApp: App {
    let container = PersistenceController.shared.container
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environment(\.managedObjectContext, container.viewContext)
        }
        
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
