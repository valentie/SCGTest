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
    
    public init() {}
    
    public var body: some View {
        
        SkeletonList(with: viewModel.news, quantity: 10) { loading, item in
            VStack {
                if let pathImage = item?.urlToImage, !pathImage.isEmpty {
                    GeometryReader { geometry in
                        KFImage(URL(string: item?.urlToImage ?? ""))
                            .placeholder {
                                SkeletonImageView()
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: 300)
                            .cornerRadius(8)
                            .clipped()
                    }
                    .frame(height: 300)
                }
                    
                
                Text(item?.title ?? "")
                    .skeleton(with: loading, animation: .pulse(), shape: .rectangle)
                    .lineLimit(1)
                    .foregroundColor(.mint)
                    .bold()
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
                
                if let desc = item?.description, !desc.isEmpty {
                    Text(desc)
                        .skeleton(with: loading, animation: .pulse(), shape: .rectangle)
                        .lineLimit(6)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
                
                Text(item?.publishedAt ?? "")
                    .skeleton(with: loading, animation: .pulse(), shape: .rectangle)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
            }
            
            .contentShape(Rectangle())
            .onTapGesture {
                if let news = item {
                    router.navigate(.detail(newsModel: news))
                }
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

//#Preview {
//    ListNewsView()
//}
