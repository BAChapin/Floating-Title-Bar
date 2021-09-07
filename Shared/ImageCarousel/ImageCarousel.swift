//
//  ImageCarousel.swift
//  ImageCarousel
//
//  Created by Brett Chapin on 8/22/21.
//

import SwiftUI

struct ImageCarousel: View {
    
    @ObservedObject var viewModel: ImageCarouselModel
    
    var testData = ["Test", "Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7", "Test8", "Test9", "Test10", "Test11"]
    
    var body: some View {
        ZStack {
            
            ForEach(viewModel.carouselItems) { item in
                CarouselItem(imageName: item.imageName)
                    .frame(minWidth: 20, idealWidth: 35, maxWidth: 45, minHeight:20, idealHeight: 35, maxHeight: 45)
                    .rotationEffect(.degrees(-(viewModel.angle - viewModel.angleOffset(forItem: item))))
                    .offset(x: viewModel.isExpanded ? viewModel.length : 0, y: 0)
                    .animation(.easeOut(duration: 0.5), value: viewModel.isExpanded) // TODO: If the value is missing, it animates on rotation as well.
                    .rotationEffect(.degrees(viewModel.angle - viewModel.angleOffset(forItem: item)))
            }
            .onTapGesture {
                viewModel.isExpanded.toggle()
            }
            
            Image("Group")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 20, idealWidth: 35, maxWidth: 45, minHeight:20, idealHeight: 35, maxHeight: 45)
                .clipShape(Circle())
                .overlay {
                    Image(systemName: "xmark")
                        .frame(minWidth: 20, idealWidth: 35, maxWidth: 45, minHeight:20, idealHeight: 35, maxHeight: 45)
                        .background(Color.black.opacity(0.4))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .opacity(viewModel.isExpanded ? 1 : 0)
                        .animation(.easeIn(duration: 0.3), value: viewModel.isExpanded)
                }
                .onTapGesture {
                    viewModel.isExpanded.toggle()
                }
        }
        .gesture(DragGesture()
                    .onChanged(viewModel.rotationGestureOnChange)
                    .onEnded(viewModel.rotationGestureOnEnd)
        )
    }
    
    func angleOffset(forItem item: String) -> Double {
        let index = testData.firstIndex(of: item)!
        let offset = 360 / (testData.count + 0)
        return Double(offset * index)
    }
}

//struct ImageCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCarousel()
//    }
//}
