//
//  FeaturedMovieView.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import SwiftUI

struct FeaturedMovieView: View {
    var movie: Movie
    var body: some View {
            ZStack(alignment: .bottom) {
                Image(movie.thumbnail)
                    .resizable()
                    .clipped()
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.35)
                    .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .foregroundColor(.white)
                            .bold()
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
            }
    }
}

struct FeaturedMovieView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedMovieView(movie: moviesData.first!)
    }
}
