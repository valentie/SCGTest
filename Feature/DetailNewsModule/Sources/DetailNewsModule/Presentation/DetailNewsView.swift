//
//  DetailNewsView.swift
//
//
//  Created by Valentie on 21/6/2567 BE.
//

import SwiftUI
import CoreModule
import Kingfisher
import SkeletonUI

public struct DetailNewsView: View {
    @Environment(\.detailNewsRouter) private var router: DetailNewsRouterLogic
    @EnvironmentObject private var viewModel: DetailNewsViewModel
    
    @State private var imageFailedToLoad = false
    
    public init() {}
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    if !imageFailedToLoad {
                        KFImage(URL(string: viewModel.urlToImage))
                            .onSuccess { _ in
                                imageFailedToLoad = false
                            }
                            .onFailure { _ in
                                imageFailedToLoad = true
                            }
                            .placeholder {
                                SkeletonImageView()
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: 300)
                            .clipped()
                    }
                    
                    Text("\(viewModel.titleText)")
                        .foregroundColor(.mint)
                        .bold()
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
                    
                    if !viewModel.descriptionText.isEmpty {
                        Text(viewModel.descriptionText)
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    }
                    
                    if !viewModel.publishedAt.isEmpty {
                        Text(viewModel.publishedAt)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                    }
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Detail")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .toolbarBackground(Color.mint, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBackButton(color: .white, text: "Back")
    }
}
