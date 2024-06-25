//
//  File.swift
//  
//
//  Created by Valentie on 21/6/2567 BE.
//

import Foundation
import CoreModule

@MainActor
public final class DetailNewsViewModel: ObservableObject {
    // MARK: - Instance properties
    
    // MARK: - Observed properties
    @Published public var titleText: String = ""
    @Published public var descriptionText: String = ""
    @Published public var urlToImage: String = ""
    @Published public var publishedAt: String = ""
    @Published public var contentText: String = ""
    // MARK: - Lifecycle
    
    public init(
        titleText: String = "",
        descriptionText: String = "",
        urlToImage: String = "",
        publishedAt: String = "",
        contentText: String = ""
    ) {
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.urlToImage = urlToImage
        self.publishedAt = formatDate(from: publishedAt) ?? ""
        self.contentText = contentText
    }
}
