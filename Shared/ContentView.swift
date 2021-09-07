//
//  ContentView.swift
//  Shared
//
//  Created by Brett Chapin on 8/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var scrollViewOffset: CGFloat = 0
    @State private var oldOffset: CGFloat = 0
    
    @StateObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TrackableScrollView(contentOffset: $viewModel.scrollViewOffset) {
                ForEach(1...1000, id: \.self) { num in
                    Text("\(num)")
                }
            }
            .onChange(of: viewModel.scrollViewOffset) { newValue in
                viewModel.scrollViewChanged(newValue: newValue)
            }
            
            FTBView(viewModel: viewModel.ftbViewModel) {
                ImageCarousel(viewModel: ImageCarouselModel(items: []))
            }
            .onAppear {
                viewModel.ftbViewModel = FTBViewModel(title: "Family & Friends", titleAction: {
                    viewModel.scrollViewOffset = 0
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
