//
//  DetailNewsResolver.swift
//  SCGTestCoding
//
//  Created by Valentie on 21/6/2567 BE.
//

import SwiftUI
import DetailNewsModule

@MainActor
struct DetailNewsResolver {
    func resolveView(newsNode: DetailNewsNode) -> some View {
        let detailNewsView = DetailNewsView()
        let viewModel = DetailNewsViewModel(titleText: newsNode.titleText,
                                            descriptionText: newsNode.descriptionText,
                                            urlToImage: newsNode.urlToImage,
                                            publishedAt: newsNode.publishedAt,
                                            contentText: newsNode.contentText)
        return detailNewsView
            .environmentObject(viewModel)
    }
}
