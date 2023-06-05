//
//  TrailerView.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import SwiftUI
import SafariServices

struct TrailerView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            SafariView(movie: movie, safariVC: SFSafariViewController(url: URL(string: movie.trailerLink)!))
        }
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView(movie: moviesData.first!)
    }
}
