//
//  DetailView.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 03.12.2021.
//

import SwiftUI

struct DetailView: View {
    
    @State private var presentSefariView = false
    
    let repo: Repository
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 12) {
                
                VStack(alignment: .center) {
                    RemoteImage(url: repo.owner.userImage)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                        .frame(width: geo.size.width, height: geo.size.height * 0.2)
                      
                    Text(repo.owner.login)
                        .font(.title)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("About:")
                            .font(.title2)
                        Text(repo.description ?? " Invalid Description")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("To Repository:")
                            .font(.title2)
                        Text(repo.repoUrl)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.presentSefariView = true
                            }
                    }
                }
            }
        }
        .navigationTitle(repo.name)
        .padding(.horizontal)
        .fullScreenCover(isPresented: $presentSefariView) {
            SafariView(url: URL(string: repo.repoUrl) ?? URL(string: "https://github.com")!)
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(repo: Repository(id: 1, name: "Repo name", repoUrl: "https://github.com", description: "Some description", stars: 1, language: "Swift", owner: Owner(login: "Login", userImage: "person")))
    }
}
