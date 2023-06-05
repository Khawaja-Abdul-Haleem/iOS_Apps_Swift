//
//  MovieData.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import Foundation

let moviesData:[Movie] = load(movieJSON)

func load<T:Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError(findError(fileName: filename))
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(loadError(fileName: filename, error: String(error.localizedDescription)))
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(parseError(fileName: filename, decodable: T.self as! Decodable, error: String(error.localizedDescription)))
       
    }
}
