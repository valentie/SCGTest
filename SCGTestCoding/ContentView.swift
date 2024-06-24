//
//  ContentView.swift
//  SCGTestCoding
//
//  Created by Valentie on 20/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavRootView(navigationStore: NavigationStore())
        .colorScheme(.light)
    }
}
