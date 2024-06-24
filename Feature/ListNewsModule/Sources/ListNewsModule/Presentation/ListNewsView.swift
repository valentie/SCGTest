//
//  ListNewsView.swift
//
//
//  Created by Valentie on 20/6/2567 BE.
//

import SwiftUI
import CoreModule
import Kingfisher
import SkeletonUI

public struct ListNewsView: View {
    @Environment(\.listNewsRouter) private var router: ListNewsRouterLogic
    @StateObject var viewModel = ListNewsViewModel()
    @State private var showAlert = false
    
    public init() {}
    
    public var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                SkeletonList(with: viewModel.news, quantity: 10) { loading, item in
                    NewsItemView(item: item, loading: loading)
                }
            case .success:
                SkeletonList(with: viewModel.news, quantity: 10) { loading, item in
                    VStack {
                        NewsItemView(item: item, loading: false)
                    }
                    .onAppear {
                        if let lastIndex = viewModel.news.lastIndex(where: { $0.id == item?.id }), lastIndex == viewModel.news.count - 2 {
                            viewModel.getNews(more: true)
                        }
                    }
                    .onTapGesture {
                        if let news = item {
                            router.navigate(.detail(newsModel: news))
                        }
                    }
                }
            case .failed:
                Text("Failed to load news.")
                    .foregroundColor(.red)
            case .none:
                EmptyView()
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            if case .failed(let error) = viewModel.state {
                return Alert(title: Text("Error"), message: Text(error.getLocalizedDescription()), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text("Error"), message: Text("Unknown error"), dismissButton: .default(Text("OK")))
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("News")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .toolbarBackground(Color.mint, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getNews()
        }
    }
}
