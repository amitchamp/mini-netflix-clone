//
//  HomePageImageCarousel.swift
//  MiniNetflixClone
//
//  Created by Sumit on 12/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct HomePageCarouselView: View {
    
    @State var index = 0

    let imageData: [Data]
    let imageFrameSize: CGFloat = 50
    let imageFrameHeight: CGFloat = 250

    var body: some View {

        let totalPopularImage: Int = self.imageData.count

        return GeometryReader { geometry in
            ImageCarousel(index: self.$index.animation(), maxIndex: totalPopularImage - 1) {
                ForEach(0..<totalPopularImage, id: \.self) { index in
                    Image(uiImage: UIImage(data: self.imageData[index]) ?? UIImage(imageLiteralResourceName: "Property_1"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width - self.imageFrameSize, height: self.index == index ? self.imageFrameHeight:  220)
                        .animation(.easeInOut)
                        .cornerRadius(self.index == index ? 15 : 30)
                        .clipped()
                }
            }
            .frame(height: self.imageFrameHeight + 10)
            .padding(.top, 10)
        }
    }
}

struct HomePageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageCarouselView(imageData: [])
    }
}
