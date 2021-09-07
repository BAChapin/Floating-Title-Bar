//
//  CarouselItem.swift
//  CarouselItem
//
//  Created by Brett Chapin on 8/22/21.
//

import SwiftUI

struct CarouselItem: View {
    
    // Variables
    // var user: User
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .clipped()
//            .onTapGesture {
//                // Present User Profile View
//            }
    }
}
