//
//  ImageTabView.swift
//  ImageTabView
//
//  Created by Brett Chapin on 8/11/21.
//

import SwiftUI

struct ContentTabView<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: .infinity, style: .continuous)
                .frame(minWidth: 50, idealWidth: 80, maxWidth: 100, minHeight: 30, idealHeight: 45, maxHeight: 55)
                .foregroundColor(.purple)
            
            content()
                .padding(.trailing, 5)
            
            Spacer()
        }
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView {
            Text("H")
        }
    }
}
