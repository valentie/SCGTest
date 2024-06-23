//
//  File.swift
//  
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Combine
import CoreModule

class ListNewsViewModel: ObservableObject {
    
    var newsUseCases = NewsUseCases(repo: NewsRepositoryImpl(dataSource: NewsDataImpl()))
    var cancellables = Set<AnyCancellable>()
    
    @Published var state: CoreModule.ViewState = .none
    @Published var news: [NewsModel] = .init()
    @Published var page: Int = 0
    
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
                let objects = response.articles.flatMap { $0.map { NewsModel(author: $0.author,
                                                                             title: $0.title,
                                                                             description: $0.description,
                                                                             url: $0.url,
                                                                             urlToImage: $0.urlToImage,
                                                                             publishedAt: formatDate(from: $0.publishedAt ?? ""),
                                                                             content: $0.content) } }
                self.news = objects ?? []
                self.state = .success
            })
            .store(in: &cancellables)
    }
}
