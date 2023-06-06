//
//  MusicApp_WatchOS_SwiftUIApp.swift
//  MusicApp_WatchOS_SwiftUI WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import SwiftUI

@main
struct MusicApp_WatchOS_SwiftUIApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
