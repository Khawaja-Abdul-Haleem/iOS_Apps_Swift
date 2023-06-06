//
//  ViewMemo.swift
//  Memo_WatchOS WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import SwiftUI
import CoreData

struct ViewMemo: View {
    
    // Coredata Fetch Request
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)], animation: .easeIn) var results : FetchedResults<Memo>
    var body: some View {
        
        List(results){ item in
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 3, content: {
                    Text(item.title ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text("last Modified")
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    
                    Text(item.dateAdded ?? Date(), style: .date)
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })
                
                Spacer(minLength: 4)
                // edit button
                NavigationLink(
                    destination: AddItems(memoItem: item),
                    label: {
                        Image(systemName: "square.and.pencil")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(.orange)
                            .cornerRadius(8)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                
            }
            
        }
        .listStyle(CarouselListStyle())
        .padding(.top)
        .overlay(
            Text(results.isEmpty ? "No Memo Found" : "")
        )
        .navigationTitle("Memo's")
    }
}

struct ViewMemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewMemo()
    }
}
