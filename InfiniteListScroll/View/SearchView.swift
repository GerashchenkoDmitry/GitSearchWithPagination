//
//  SearchView.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 02.12.2021.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    let onCommitTapped: () -> Void
    let onChanged: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("search",
                      text: $searchText,
                      onEditingChanged: { _ in
                        
                      },
                      onCommit: { onCommitTapped() }
            )
                .padding(.horizontal)
                .cornerRadius(3.0)
                .foregroundColor(.primary)
            
            Button(action: { searchText = "" }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText == "" ? 0 : 1)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        SearchView(searchText: .constant("search text"), onCommitTapped: )
//    }
//}
