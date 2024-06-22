//
//  NetworkingError.swift
//  
//
//  Created by Valentie on 23/6/2567 BE.
//

import Foundation
import Moya

public struct NetworkingError: Error {

    let httpResponse: HTTPURLResponse?
    let networkData: Data?
    let baseError: MoyaError

    init(_ response: Response) {
        self.baseError = MoyaError.statusCode(response)
        self.httpResponse = response.response
        self.networkData = response.data
    }

    func getLocalizedDescription() -> String {

       return self.baseError.localizedDescription
    }
}
