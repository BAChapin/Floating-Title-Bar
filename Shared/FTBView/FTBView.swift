//
//  FBBView.swift
//  FBBView
//
//  Created by Brett Chapin on 8/11/21.
//

import SwiftUI

struct FTBView<Content: View>: View {
    
    let content: () -> Content
    @ObservedObject var viewModel: FTBViewModel
    
    init(viewModel: FTBViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading) {
                
                Text(viewModel.title)
                    .font(.title3)
                    .lineLimit(2)
                    .frame(minHeight: 30, idealHeight: 45, maxHeight: 55)
                    .padding(.leading, 70)
                    .padding(.trailing, 15)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: .infinity, style: .continuous))
                    .offset(x: viewModel.isExpanded ? 0 : -375, y: 0)
                    .animation(.easeOut(duration: viewModel.isExpanded ? 0.5 : 0.75))
                    .onTapGesture {
                        viewModel.tapAction()
                    }
                    
                
                ContentTabView {
                    content()
                }
                    .offset(x: -35, y: 0)
            }
            
            Spacer()
            
        }
        .padding(.trailing, 50)
        .frame(minHeight: 35, idealHeight: 50, maxHeight: 65)
    }
}

struct FBBView_Previews: PreviewProvider {
    static var previews: some View {
        FTBView(viewModel: .init(title: "Hello World", titleAction: {
            print("Title tapped")
        })) {
            Text("H")
        }
    }
}
