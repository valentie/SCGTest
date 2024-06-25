//
//  SkeletonImageView.swift
//
//
//  Created by Valentie on 23/6/2567 BE.
//

import SwiftUI
import SkeletonUI

public struct SkeletonImageView: View {
    
    public init() { }
    
    public var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .cornerRadius(10)
            .skeleton(with: true, animation: .pulse(), appearance: .solid(color: .gray.opacity(0.2), background: .clear), shape: .rectangle)
            .frame(height: 300)
    }
}
