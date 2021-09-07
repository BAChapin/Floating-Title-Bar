//
//  ImageCarouselModel.swift
//  ImageCarouselModel
//
//  Created by Brett Chapin on 8/22/21.
//

import SwiftUI

class ImageCarouselModel: ObservableObject {
    // var circleImage: UIImage
    // var users: [User]
    var items: [MockItem]
    @Published var carouselItems: [MockItem]
    @Published var isExpanded: Bool = false
    @Published var length: CGFloat = UIScreen.main.bounds.width / 2.5
    @Published var angle: Double = 0.0
    @Published var lastAngle: Double = 0.0
    var isAtEnd: Bool = false
    var isAtStart: Bool = true
    var circleImage: UIImage!
    
    init(items: [MockItem]) {
        self.items = items
        print(items.count)
        if items.count > 5 {
                self.carouselItems = Array(items[0...4])
        } else {
            self.carouselItems = items
            if items.count <= 4 {
                isAtEnd = true
            }
        }
    }
    
    /**
     Calculates the Angle offset for a given CarouselItem.
     
     - parameter item: A MockItem which will be used to find its index by which to perform the calculation on.
     */
    func angleOffset(forItem item: MockItem) -> Double {
        let index = carouselItems.firstIndex(of: item)!
        let offset = 360 / 12
        return Double(offset * index)
    }
    
    /**
     Translates a DragGesture into rotational motion for the carousel.
     
     - parameter value: A DragGesture.Value to translate the value passed by the gesture into a rotation angle.
     */
    func rotationGestureOnChange(_ value: DragGesture.Value) {
        var theta = (atan2(value.location.x - self.length / 2, self.length / 2 - value.location.y) - atan2(value.startLocation.x - self.length / 2, self.length / 2 - value.startLocation.y)) * 180 / .pi
//        if (theta < 0) { theta += 360 }
        if theta > 0 {
            if !isAtEnd {
                self.angle = theta + self.lastAngle
            }
        } else {
            if !isAtStart {
                self.angle = theta + self.lastAngle
            }
        }
        calculatePosition()
    }
    
    /**
     Once the DragGesture has concluded, it saves the last angle calculated from the gesture motion. This will also move the angle to a increment of carousel.
     */
    func rotationGestureOnEnd(_ value: DragGesture.Value) {
        self.angle = angleIncrement(angle)
        lastAngle = angle
        calculatePosition()
    }
    
    private func calculatePosition() {
        let indexAtAngle = Int(floor(angle / (360 / 12)))
        var startIndex: Int = 0
        var endIndex: Int = 0
        print(#function, indexAtAngle)
        let start = Double(indexAtAngle).remainder(dividingBy: 12)
        print(start)
        switch indexAtAngle {
        case 4:
            startIndex = Int(start + 5)
            endIndex = 0
        case 5:
            startIndex = Int(start + 5)
            endIndex = 1
        case 6:
            startIndex = Int(start + 5)
            endIndex = 2
        default:
            startIndex = Int(start + 5)
            endIndex = Int(start + 8)
        }
        carouselItems[0] = items[25]
        print(startIndex, endIndex)
        
    }
    
    private func angleIncrement(_ currentAngle: Double) -> Double {
        let angle: Double = 360 / 12
        let remainder = currentAngle.remainder(dividingBy: angle)
        let roundUp = remainder > angle / 2
        return roundUp ? currentAngle + (angle - remainder) : currentAngle - remainder
    }
    
//    func angleOffset(forIndex index: Int) -> Double {
//
//    }
    
    
    // indexHandler()
    // userForIndex() -> User
    
    // Animate outward from the center
    // display 4 users/CarouselItems
    // snap to positions
}
