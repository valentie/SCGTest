//
//  NewsDataImpl.swift
//  DetailModule
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Moya
import CombineMoya
import Combine

struct NewsDataImpl: NewsRepository {
    let provider = MoyaProvider<NewsServices>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    func getNews(page: Int) -> AnyPublisher<ArticlesModel, MoyaError> {
        provider.session.sessionConfiguration.timeoutIntervalForRequest = 35
        
        return provider.requestPublisher(.getNews(page: page))
            .filterSuccessfulStatusCodes()
            .map(ArticlesModel.self)
            .eraseToAnyPublisher()
    }
}
