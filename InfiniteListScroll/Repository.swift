//
//  Repository.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 01.12.2021.
//

import Combine

struct GithubSearchResult<T: Codable>: Codable {
    let items: [T]
}

struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let repoUrl: String
    let description: String?
    let stars: Int
    let language: String?
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, owner, language
        case stars = "stargazers_count"
        case repoUrl = "html_url"
    }
}

struct Owner: Codable, Equatable {
    let login: String
    let userImage: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case userImage = "avatar_url"
    }
}
