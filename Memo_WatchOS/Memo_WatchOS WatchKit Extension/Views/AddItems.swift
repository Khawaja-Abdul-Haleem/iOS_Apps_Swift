//
//  AddItems.swift
//  Memo_WatchOS WatchKit Extension
//
//  Created by Khawaja Abdul Haleem on 06/06/2023.
//

import SwiftUI
import CoreData

struct AddItems: View {
    
    @State var memoText = ""
    
    // getting context from environment
    @Environment(\.managedObjectContext) var contenxt
    
    // presentaton
    @Environment(\.presentationMode) var presentation
    
    // edit option
    var memoItem : Memo? 
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Memories....", text: $memoText)
            
            Button(action: {
                
                addMemo()
                
            }, label: {
                Text("Save")
                    .foregroundColor(.black).bold()
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.orange)
                    .cornerRadius(15)
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(memoText == "")
        }
        .navigationTitle("\(memoItem == nil ? "Add Memo" : "Update")")
        .onAppear(perform: {
            // verifying if memo has data
            if let memo = memoItem{
                memoText = memo.title ?? ""
            }
        })
       
    }
    
    // adding memo
    func addMemo() {
        let memo = memoItem == nil ? Memo(context: contenxt) : memoItem!
        memo.title = memoText
        memo.dateAdded = Date()
        
        // saving
        do {
            try contenxt.save()
            // if success
            // closing view
            presentation.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct AddItems_Previews: PreviewProvider {
    static var previews: some View {
        AddItems()
    }
}
