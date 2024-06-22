//
//  File.swift
//  
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Combine

class ListNewsViewModel: ObservableObject {
    
    var newsUseCases = NewsUseCases(repo: NewsRepositoryImpl(dataSource: NewsDataImpl()))
    var cancellables = Set<AnyCancellable>()
    
    @Published var state: ViewState = .none
    @Published var news: [NewsModel] = .init()
    @Published var page: Int = 0
//    @Published var title = "Pet Grooming"
//    @Published var description = "A day dedicated to pet grooming"
//    @Published var date: Date = .init()
    
    func getNews() {
        state = .loading
        newsUseCases.getNews(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case let .failure(error) = completion else { return }
                guard let response = error.response else { return }
                let netError = NetworkingError(response)
                self.state = .failed(error: netError)
            }, receiveValue: { response in
                self.news = response.articles ?? []
                self.state = .success
            })
            .store(in: &cancellables)
    }
}
