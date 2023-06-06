//
//  HomeView.swift
//  Memo_WatchOS WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import SwiftUI
import CoreData
struct HomeView: View {
    var body: some View {
        // geometry reader for getting Frame
        GeometryReader { geometry in
            
            let rect = geometry.frame(in: .global)
            
            VStack(spacing: 15) {
                HStack(spacing: 25) {
                    // Buttons
                    
                    NavigationLink(destination:
                                    AddItems(),
                                   label: {
                        NavButtons(image: "plus", title: "Memo", rect: rect, color: .purple)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination:
                                    DeleteMemo(),
                                   label: {
                        NavButtons(image: "trash", title: "Delete", rect: rect, color: .red)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                   
                }
                
                .frame(width: rect.width, alignment: .center)
                
                HStack(spacing: 25) {
                    // Buttons
                   
                    NavigationLink(destination:
                                    ViewMemo(),
                                   label: {
                        NavButtons(image: "doc.plaintext", title: "View", rect: rect, color: .blue)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    NavButtons(image: "star", title: "Rating", rect: rect, color: .orange)
                }
                .frame(width: rect.width, alignment: .center)
            }
            .padding(.top, 20)
            
        }
    }
}

struct NavButtons: View {
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
        
        VStack(spacing: 8) {
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.width / 3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
