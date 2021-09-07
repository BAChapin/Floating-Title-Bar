//
//  FBBViewModel.swift
//  FBBViewModel
//
//  Created by Brett Chapin on 8/11/21.
//

import SwiftUI

class FTBViewModel: ObservableObject {
    @Published var isExpanded: Bool = true
    @Published var title: String
    @Published var handler: () -> Void
    
    init(title: String, titleAction handler: @escaping () -> Void) {
        self.title = title
        self.handler = handler
    }
    
    func tapAction() {
        if isExpanded {
            handler()
        }
    }
}
