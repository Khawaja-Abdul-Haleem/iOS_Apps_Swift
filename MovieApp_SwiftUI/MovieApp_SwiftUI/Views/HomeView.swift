//
//  HomeView.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import SwiftUI
import Combine
 
struct HomeView : View {
    var catagories: [String: [Movie]] {
        .init(grouping: moviesData,
              by: {$0.catagory.rawValue}
        )
    }
    var featuredMovies = moviesData.filter({$0.isFeaturedMovie == true})
    var body: some View {
        NavigationView {
            ScrollView(.vertical , showsIndicators: false) {
                VStack {
                    NavigationLink(destination: MovieDetail(movie: featuredMovies[0])) {
                        PageView(featuredMovies.map { FeaturedMovieView(movie: $0) })
                            .frame(height: 225)
                    }
                    VStack {
                        ForEach(catagories.keys.sorted(), id: \String.self) { key in
                            MovieRow(catagoryName: key, movies: self.catagories[key]!)
                                .frame(height: 320)
                                .padding(.top)
                                .padding(.bottom)
                        }
                    }
                    .padding()
                }
                .navigationBarTitle(Text("MOVIES").bold())
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
