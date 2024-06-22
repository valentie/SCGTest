//
//  ListNewsRouterLogic.swift
//
//
//  Created by Valentie on 20/6/2567 BE.
//

import Foundation
import SwiftUI

public protocol ListNewsRouterLogic: AnyObject {
    func navigate(_ route: ListNewsRoute)
}

public enum ListNewsRoute {
    case back
    case detail(newsModel: NewsModel)
}

class DefaultListNewsRouter: ListNewsRouterLogic {
    public func navigate(_ route: ListNewsRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var listNewsRouter: ListNewsRouterLogic {
        get { self[ListNewsRouterKey.self] }
        set { self[ListNewsRouterKey.self] = newValue }
    }
}

struct ListNewsRouterKey: EnvironmentKey {
    static let defaultValue: ListNewsRouterLogic = DefaultListNewsRouter()
}
