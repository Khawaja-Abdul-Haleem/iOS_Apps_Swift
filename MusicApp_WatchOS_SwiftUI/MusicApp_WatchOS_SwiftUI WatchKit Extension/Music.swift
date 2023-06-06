//
//  Music.swift
//  MusicApp_WatchOS_SwiftUI WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import Foundation

struct Music: Hashable {
    let artistName: String
    let poster: String
}

let musics = [
    Music(artistName: "Nicky Jam", poster: "poster_1"),
    Music(artistName: "Billie Eilish", poster: "poster_2"),
    Music(artistName: "J Balvin", poster: "poster_3"),
    Music(artistName: "Khalid", poster: "poster_4"),
    Music(artistName: "Katy Perry", poster: "poster_5"),
    Music(artistName: "Post Malone", poster: "poster_6"),
    Music(artistName: "Ariana Grande", poster: "poster_7"),
    Music(artistName: "The Chainsmokers", poster: "poster_8"),
    Music(artistName: "Martin Garrix", poster: "poster_9")
]

