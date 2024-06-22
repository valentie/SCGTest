//
//  DetailNewsView.swift
//
//
//  Created by Valentie on 21/6/2567 BE.
//

import SwiftUI

public struct DetailNewsView: View {
    @Environment(\.detailNewsRouter) private var router: DetailNewsRouterLogic
    @EnvironmentObject private var viewModel: DetailNewsViewModel
    
    public init() {}
    
    public var body: some View {
        Text("\(viewModel.articleId)")
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

#Preview {
    DetailNewsView()
}
