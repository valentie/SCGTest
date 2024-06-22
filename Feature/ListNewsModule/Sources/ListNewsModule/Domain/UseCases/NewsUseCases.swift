//
//  NewsUseCases.swift
//  DetailModule
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Combine
import Moya

struct NewsUseCases: NewsRepository {
    var repo: NewsRepository
    
    func getNews(page: Int) -> AnyPublisher<ArticlesModel, MoyaError> {
        return repo.getNews(page: page)
    }
}
