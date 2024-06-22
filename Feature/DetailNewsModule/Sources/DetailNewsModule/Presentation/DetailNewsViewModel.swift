//
//  File.swift
//  
//
//  Created by Valentie on 21/6/2567 BE.
//

import Foundation

@MainActor
public final class DetailNewsViewModel: ObservableObject {
    // MARK: - Instance properties
    
    // MARK: - Observed properties
    
    @Published public var articleId: String = ""
    
    // MARK: - Lifecycle
    
    public init(
        articleId: String = ""
    ) {
        self.articleId = articleId
    }
}
