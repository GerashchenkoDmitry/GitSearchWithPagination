//
//  GithubAPI.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 01.12.2021.
//

import Foundation
import Combine

enum GithubAPI {
    static let pageSize = 10
    
    static func searchRepos(query: String, page: Int) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query.replacingOccurrences(of: " ", with: "&"))&sort=stars&per_page=\(Self.pageSize)&page=\(page)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GithubSearchResult<Repository>.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
