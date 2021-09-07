//
//  FBBView_TestApp.swift
//  Shared
//
//  Created by Brett Chapin on 8/11/21.
//

import SwiftUI

@main
struct FBBView_TestApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ImageCarousel(viewModel: ImageCarouselModel(items: MockItem.generate(110)))
        }
    }
}
