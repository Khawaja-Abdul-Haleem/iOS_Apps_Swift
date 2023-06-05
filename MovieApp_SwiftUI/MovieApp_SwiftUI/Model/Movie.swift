//
//  Movie.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import Foundation

struct Movie: Hashable, Codable, Identifiable {
    var id: Int
    var thumbnail: String
    var title: String
    var description: String
    var trailerLink: String
    var catagory: Catagory
    var isFeaturedMovie: Bool
    
    enum Catagory: String, CaseIterable, Codable, Hashable {
        case marvel = "Marvel"
        case dc = "DC"
        case actionAdventure = "Action and adventure"
    }
}
