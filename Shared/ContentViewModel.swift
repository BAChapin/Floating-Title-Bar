//
//  ContentViewModel.swift
//  ContentViewModel
//
//  Created by Brett Chapin on 8/17/21.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var scrollViewOffset: CGFloat = 0.0
    private var oldOffset: CGFloat = 0.0
    @Published var ftbViewModel: FTBViewModel = FTBViewModel(title: "Hello World") {
        print("Title Tapped")
    }
    
    func scrollViewChanged(newValue: CGFloat) {
        if newValue > 0 {
            if newValue > oldOffset {
                ftbViewModel.isExpanded = false
            } else {
                ftbViewModel.isExpanded = true
            }
            oldOffset = newValue
        } else {
            oldOffset = 0
        }
    }
    
    private func scrollToTop() {
        scrollViewOffset = 0.0
    }
}
