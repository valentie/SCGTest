//
//  DetailNewsRouterLogic.swift
//  
//
//  Created by Valentie on 21/6/2567 BE.
//

import Foundation
import SwiftUI

public protocol DetailNewsRouterLogic: AnyObject {
    func navigate(_ route: DetailNewsRoute)
}

public enum DetailNewsRoute {
    case back
}

class DefaultDetailNewsRouter: DetailNewsRouterLogic {
    public func navigate(_ route: DetailNewsRoute) {
        assertionFailure()
    }
}

public extension EnvironmentValues {
    var detailNewsRouter: DetailNewsRouterLogic {
        get { self[DetailNewsRouterKey.self] }
        set { self[DetailNewsRouterKey.self] = newValue }
    }
}

struct DetailNewsRouterKey: EnvironmentKey {
    static let defaultValue: DetailNewsRouterLogic = DefaultDetailNewsRouter()
}
