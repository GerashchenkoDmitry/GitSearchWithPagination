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
      RepositoriesList(repos: viewModel.state.repos, isLoading: viewModel.state.canLoadNextPage, onScrolledAtBottom: viewModel.fetchNextPageIfPossible)
        .onAppear { viewModel.fetchNextPageIfPossible() }
    }
}

struct RepositoriesListContainer_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListContainer()
    }
}
