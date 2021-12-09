//
//  RepositoriesLIstView.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 01.12.2021.
//

import SwiftUI

struct RepositoriesList: View {
  
  let repos: [Repository]
  let isLoading: Bool
  let onScrolledAtBottom: () -> Void
  
    var body: some View {
      
      List {
        reposList
        if isLoading {
          loadingIndicator
        }
      }
    }
  
  private var reposList: some View {
    ForEach(repos) { repo in
      RepositoryRow(repo: repo)
        .onAppear {
          if self.repos.last == repo {
            self.onScrolledAtBottom()
          }
        }
    }
  }
  
  private var loadingIndicator: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle())
  }
}

//struct RepositoriesLIstView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepositoriesLIstView()
//    }
//}
