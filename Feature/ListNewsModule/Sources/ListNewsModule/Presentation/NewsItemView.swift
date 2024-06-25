//
//  NewsItemView.swift
//
//
//  Created by Valentie on 24/6/2567 BE.
//

import SwiftUI
import CoreModule
import Kingfisher

struct NewsItemView: View {
    var item: NewsModel?
    var loading: Bool
    
    var body: some View {
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
    }
}
