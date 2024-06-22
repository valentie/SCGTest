//
//  NavigationStore.swift
//  SCGTestCoding
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation

public final class NavigationStore: ObservableObject {
    @Published public var navigationPath: [AnyHashable] = []

    public init() {}
}
