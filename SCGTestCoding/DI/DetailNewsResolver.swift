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
        let viewModel = DetailNewsViewModel(articleId: newsNode.titleText)
        
        return detailNewsView
            .environmentObject(viewModel)
    }
}
