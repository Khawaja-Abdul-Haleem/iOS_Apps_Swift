//
//  ContentView.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text(homeTabs.firstTab.rawValue)
            } .tag(0)
            HomeView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text(homeTabs.secondTab.rawValue)
                        .font(.headline)
            } .tag(1)
            HomeView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text(homeTabs.thirdTab.rawValue)
            } .tag(2)
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text(homeTabs.fourthTab.rawValue)
            } .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
