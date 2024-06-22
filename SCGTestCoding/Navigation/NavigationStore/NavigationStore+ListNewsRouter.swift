//
//  NavigationStore+ListNewsRouter.swift
//  SCGTestCoding
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import ListNewsModule

extension NavigationStore: ListNewsRouterLogic {
    public func navigate(_ route: ListNewsRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        case let .detail(newsModel):
            navigationPath.append(DetailNewsNode(titleText: newsModel.title ?? "",
                                                 descriptionText: newsModel.description ?? "",
                                                 urlToImage: newsModel.urlToImage ?? "",
                                                 publishedAt: newsModel.publishedAt ?? "",
                                                 contentText: newsModel.content ?? ""))
        }
    }
}
