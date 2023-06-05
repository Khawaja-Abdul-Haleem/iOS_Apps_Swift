//
//  Constants.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import Foundation

enum homeTabs: String {
    case firstTab = "Home"
    case secondTab = "TV Shows"
    case thirdTab = "Movies"
    case fourthTab = "Kids"
}

let watchButton = "Watch Trailer"
let homeTitle = "MOVIES"

let movieJSON = "movies.json"

func findError(fileName: String) -> String {
    return "Couldn't find \(fileName) in main bundle."
}

func loadError(fileName: String, error: String) -> String {
    return "Couldn't load \(fileName) from main bundle:\n \(error)"
}

func parseError(fileName: String, decodable: Decodable, error: String) -> String {
    return "Couldn't parse \(fileName)  as \(decodable):\n\(error)"
}
