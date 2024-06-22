//
//  ViewFactory.swift
//  SCGTestCoding
//
//  Created by Valentie on 20/6/2567 BE.
//

import SwiftUI
import ListNewsModule
import DetailNewsModule

@MainActor
public struct ViewFactory {
    @ViewBuilder
    func getView(for node: AnyHashable) -> some View {
        switch node {
        case is ListNewsNode:
            HomeResolver().resolveView()
        case let node as DetailNewsNode:
            DetailNewsResolver().resolveView(newsNode: node)
//        case let node as DetailNode:
//            DetailResolver().resolveView(titleText: node.titleText,
//                                         descriptionText: node.descriptionText,
//                                         urlToImage: node.urlToImage,
//                                         publishedAt: node.publishedAt,
//                                         contentText: node.contentText)
        default:
            Text("Error: No Destination")
        }
    }
}
