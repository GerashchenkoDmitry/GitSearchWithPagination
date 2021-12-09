//
//  RepositoriesListContainer.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 02.12.2021.
//

import SwiftUI

struct RepositoriesListContainer: View {
    
    @ObservedObject var viewModel = RepositoriesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(
                    searchText: $viewModel.state.searchText,
                    onCommitTapped: viewModel.fetchNewRepositories,
                    onChanged: viewModel.fetchNewRepositories
                )
                .zIndex(1)
                
                RepositoriesList(repos: viewModel.state.repos, isLoading: viewModel.state.canLoadNextPage, onScrolledAtBottom: viewModel.fetchNextPageIfPossible)
            }
            .navigationTitle("Search")
        }
    }
}

struct RepositoriesListContainer_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListContainer()
    }
}
