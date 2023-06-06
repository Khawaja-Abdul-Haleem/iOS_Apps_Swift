//
//  ArtistView.swift
//  MusicApp_WatchOS_SwiftUI WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import SwiftUI

struct ArtistView: View {
    let columns = [GridItem(.adaptive(minimum: 45), spacing: 8)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(artists, id: \.self) { item in
                        ZStack {
                            ArtistCardView(artist: item)
                            NavigationLink(
                                destination: SongView().navigationTitle(""),
                                label: {})
                            .opacity(0.1)
                        }
                        
                    }
                }
            }
        }
        .navigationTitle("Artist")
    }
}

struct ArtistCardView: View {
    let artist: Artist
    
    var body: some View {
        VStack {
            Image(artist.image)
                .resizable()
                .cornerRadius(5.0)
                .aspectRatio(contentMode: .fill)
            
            Text(artist.name)
                .font(.system(size: 7))
                .fontWeight(.bold)
                .padding(.top, 2)
            
        }
    }
}


struct ArtistView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistView()
    }
}
