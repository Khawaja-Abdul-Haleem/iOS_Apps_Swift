//
//  ContentView.swift
//  WORDLE_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 05/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
   
    var body: some View {
        
        ZStack {
            VStack(spacing: 40) {
                GameView(viewModel: viewModel)
                KeyboardView(viewModel: viewModel)
            }
            
            if viewModel.bannerType != nil {
                BannerView(bannerType: viewModel.bannerType!)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
