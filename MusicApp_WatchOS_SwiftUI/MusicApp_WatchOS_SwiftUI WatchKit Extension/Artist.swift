//
//  Artist.swift
//  MusicApp_WatchOS_SwiftUI WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import Foundation
struct Artist: Hashable {
    let name: String
    let image: String
}

let artists = [
    Artist(name: "Kesha", image: "artist_1"),
    Artist(name: "Connie Francis", image: "artist_2"),
    Artist(name: "Years & Years", image: "artist_3"),
    Artist(name: "Elton John", image: "artist_4"),
    Artist(name: "Hozier", image: "artist_5"),
    Artist(name: "Mariah Carey", image: "artist_6"),
    Artist(name: "Rage Against", image: "artist_7"),
    Artist(name: "Usher", image: "artist_8"),
    Artist(name: "Selena Gomez", image: "artist_9"),

]
