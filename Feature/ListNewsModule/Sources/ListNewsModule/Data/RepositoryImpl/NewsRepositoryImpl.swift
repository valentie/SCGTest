//
//  NewsRepositoryImpl.swift
//  DetailModule
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Combine
import Moya

struct NewsRepositoryImpl: NewsRepository{
    
    var dataSource: NewsRepository
    
    func getNews(page: Int) -> AnyPublisher<ArticlesModel, MoyaError> {
        return dataSource.getNews(page: page)
    }
}
