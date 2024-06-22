//
//  NewsRepository.swift
//  DetailModule
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Combine
import Moya

protocol NewsRepository{
    func getNews(page: Int) -> AnyPublisher<ArticlesModel, MoyaError>
}
