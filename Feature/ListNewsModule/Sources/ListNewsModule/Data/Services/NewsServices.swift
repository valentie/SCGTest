//
//  NewsServices.swift
//  HomeModule
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import Moya

enum NewsServices {
    case getNews(page: Int)
}

// MARK: - TargetType Protocol Implementation
extension NewsServices: TargetType {
    var baseURL: URL {
        URL(string: "https://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .getNews(page):
            let param = ["country": "us",
                         "category": "business",
                         "pageSize": 10,
                         "page": page,
                         "apiKey": "6ea2e5fed6aa410ab1caa0dd75661210"] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getNews:
            return "getNews .".utf8Encoded
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .getNews:
            ["Content-type": "application/json"]
        }
    }
}

extension String {
    var utf8Encoded: Data { Data(self.utf8) }
}
