//
//  ArticlesModel.swift
//  DetailModule
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation

struct ArticlesModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsModel]?
}

public struct NewsModel: Codable, Identifiable {
//    var id: UUID = .init()
    public let id =  UUID()
    public let author: String?
    public let title: String?
    public let description: String?
    public let url: String?
    public let urlToImage: String?
    public let publishedAt: String?
    public let content: String?
}
