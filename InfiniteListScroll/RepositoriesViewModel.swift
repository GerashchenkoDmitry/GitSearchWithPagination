//
//  RepositoriesViewModel.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 01.12.2021.
//

import Foundation
import Combine

class RepositoriesViewModel: ObservableObject {
    
    @Published var state = State()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage else { return }
        
        GithubAPI.searchRepos(query: state.searchText, page: state.page)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    func fetchNewRepositories() {
        if state.searchText != "" || state.searchText != " " {
            state.canLoadNextPage = true
            state.repos = []
            state.page = 1
        } else {
            state.canLoadNextPage = false
        }
        
        GithubAPI.searchRepos(query: state.searchText, page: state.page)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    struct State {
        var searchText = ""
        var repos = [Repository]()
        var page = 1
        var canLoadNextPage = false
    }
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        
        switch completion {
            case .finished:
                break
            case .failure:
                state.canLoadNextPage = false
            }
    }
    
    private func onReceive(_ batch: [Repository]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = batch.count == GithubAPI.pageSize
    }
}
