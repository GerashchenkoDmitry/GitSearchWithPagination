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
        HStack {
            VStack(alignment: .leading) {
                Text(repo.name)
                    .lineLimit(1)
                    .font(.title)
                Text("Language: \(repo.language ?? "Unknown Language")")
                Text("Stars: \(repo.stars)")
                Text("\(repo.description ?? "repo description")")
                    .lineLimit(1)
            }
            
            Spacer()
            
            RemoteImage(url: repo.owner.userImage)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .clipShape(Circle())
                .frame(width: 60, height: 60)
        }
    }
}

struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repo: Repository(id: 1, name: "Repository name", repoUrl: "https://github.com", description: "Repo Description", stars: 1, language: "Swift", owner: Owner(login: "LOgin", userImage: "someimage")))
    }
}
