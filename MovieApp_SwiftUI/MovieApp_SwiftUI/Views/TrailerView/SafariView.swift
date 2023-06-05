//
//  SafariView.swift
//  MovieApp_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let movie: Movie
    let safariVC: SFSafariViewController
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: URL(string: movie.trailerLink)!)
        return safariVC
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        uiViewController.dismissButtonStyle = .close
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(movie: moviesData.first!, safariVC: SFSafariViewController.init(url: URL(string: moviesData.first!.trailerLink)!))
    }
}
