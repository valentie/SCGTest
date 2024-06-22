//
//  ViewState.swift
//  
//
//  Created by Valentie on 23/6/2567 BE.
//

import Foundation

enum ViewState {
    case loading
    case success
    case failed(error: NetworkingError)
    case none
}
