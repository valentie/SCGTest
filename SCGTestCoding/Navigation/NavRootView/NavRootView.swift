//
//  NavRootView.swift
//  SCGTestCoding
//
//  Created by Valentie on 20/6/2567 BE.
//

import SwiftUI
import ListNewsModule
import DetailNewsModule

struct NavRootView: View {
    @ObservedObject private var navigationStore: NavigationStore
    
    public init(navigationStore: NavigationStore) {
        self.navigationStore = navigationStore
    }
    
    var body: some View {
        NavigationStack(path: $navigationStore.navigationPath) {
            ListNewsView()
                .navigationDestination(for: AnyHashable.self) { node in
                    ViewFactory().getView(for: node)
                }
        }
        .environment(\.listNewsRouter, navigationStore)
        .environment(\.detailNewsRouter, navigationStore)
    }
}
