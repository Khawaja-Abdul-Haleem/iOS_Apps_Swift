//
//  Song.swift
//  MusicApp_WatchOS_SwiftUI WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import Foundation
struct Song: Hashable {
    let name: String
    let duration: Int
}

let songs = [
    Song(name: "Same old love", duration: 3),
    Song(name: "Feel me", duration: 4),
    Song(name: "Wolves", duration: 3),
    Song(name: "Lose you to love me", duration: 5),
    Song(name: "Good for you", duration: 4),
    Song(name: "Feel me", duration: 3),
]
