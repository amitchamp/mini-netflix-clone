//
//  ImageCarousel.swift
//  ImageCarousel
//
//  Created by Amit on 07/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct ImageCarousel<Content: View>: View {
    
    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content
    let imageWidthSize: CGFloat = 40
    let spacing: CGFloat = 10
    
    @State private var offset = CGFloat.zero
    @State private var dragging: Bool = false
    
    init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
        self._index = index
        self.maxIndex = maxIndex
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: self.spacing) {
                    self.content()
                        .frame(width: geometry.size.width - self.imageWidthSize, height: geometry.size.height)
                        .cornerRadius(15)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 4)
                        .clipped()
                }
            }
            .content.offset(x: self.offset(in: geometry), y: 0)
            .frame(width: geometry.size.width - 40, alignment: .leading)
            .gesture(
                DragGesture().onChanged { value in
                    self.dragging = true
                    self.offset = -CGFloat(self.index) * (geometry.size.width - self.imageWidthSize + self.spacing) + value.translation.width
                }
                .onEnded { value in
                    let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                    let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                    self.index = self.updateIndex(from: predictedIndex)
                    withAnimation(.easeOut) {
                        self.dragging = false
                    }
                }
            )
        }
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        
        var screenSize = geometry.size.width - self.imageWidthSize
        if self.index > 0 {
            screenSize += self.spacing
        }

        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * screenSize)
        } else {
            return -CGFloat(self.index) * (screenSize)
        }
    }
    
    func updateIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
}
