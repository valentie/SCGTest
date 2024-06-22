//
//  DetailNewsNode.swift
//  SCGTestCoding
//
//  Created by Valentie on 21/6/2567 BE.
//

import Foundation

struct DetailNewsNode: Hashable {
    let titleText: String
    let descriptionText: String
    let urlToImage: String
    let publishedAt: String
    let contentText: String
    
    init(
        titleText: String,
        descriptionText: String,
        urlToImage: String,
        publishedAt: String,
        contentText: String
    ) {
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.contentText = contentText
    }
}
