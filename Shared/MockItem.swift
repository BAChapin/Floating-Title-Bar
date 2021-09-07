//
//  MockUser.swift
//  MockUser
//
//  Created by Brett Chapin on 9/1/21.
//

import SwiftUI

struct MockItem: Identifiable, Equatable {
    let id: UUID
    let imageName: String
    
    static func generate(_ items: Int) -> [MockItem] {
        var returnItems: [MockItem] = []
        for _ in 1...items {
            returnItems.append(.init(id: UUID(), imageName: "Test\(Int(items / 12))"))
        }
        return returnItems
    }
    
}
