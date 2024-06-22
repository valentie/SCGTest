//
//  ListNewsView.swift
//
//
//  Created by Valentie on 20/6/2567 BE.
//

import SwiftUI

public struct ListNewsView: View {
    @Environment(\.listNewsRouter) private var router: ListNewsRouterLogic
    @StateObject var viewModel = ListNewsViewModel()
    
    public init() {}
    
    public var body: some View {
//        GeometryReader { geometry in
//            NavigationStack {
                List {
                    ForEach(viewModel.news, id: \.id, content: { news in
                        HStack {
                            Text(news.title ?? "")
                                .padding()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            router.navigate(.detail(newsModel: news))
                        }
                    })
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
//            }
//        }
    }
}

//#Preview {
//    ListNewsView()
//}
