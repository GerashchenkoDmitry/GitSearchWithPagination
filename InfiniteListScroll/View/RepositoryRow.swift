//
//  RepositoryRow.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 01.12.2021.
//

import SwiftUI

struct RepositoryRow: View {
  
  let repo: Repository
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(repo.name)
        .font(.title)
      Text("Stars: \(repo.stars)")
      Text("\(repo.description ?? "repo description")")
    }
  }
}

struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
      RepositoryRow(repo: Repository(id: 1, name: "Repository name", description: "Repo Description", stars: 1))
    }
}
