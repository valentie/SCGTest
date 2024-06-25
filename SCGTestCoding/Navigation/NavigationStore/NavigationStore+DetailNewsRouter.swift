//
//  NavigationStore+DetailNewsRouter.swift
//  SCGTestCoding
//
//  Created by Valentie on 21/6/2567 BE.
//

import Foundation
import DetailNewsModule

extension NavigationStore: DetailNewsRouterLogic {
    public func navigate(_ route: DetailNewsRoute) {
        switch route {
        case .back:
            _ = navigationPath.popLast()
        }
    }
}
