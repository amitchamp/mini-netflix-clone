//
//  HImageSVView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct HImageSVView: View {

    @State var tag: Int? = nil
    @State var movieId: Int = 0

    let title: String
    let posterDetils: [PosterRedirect]

    var body: some View {
        return VStack {
            NavigationLink(destination: MovieDetailScreenView(movieId: movieId), tag: 1, selection: $tag) {
                EmptyView()
            }

            HStack {
                Text(title)
                    .font(.system(size: 24))
                    .bold()

                Spacer()

                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 20, height: 15)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<self.posterDetils.count, id: \.self) { index in
                        RemoteImageView(imageUrl: self.posterDetils[index].posterUrl, imageWidth: "w154")
                            .onTapGesture {
                                self.movieId = self.posterDetils[index].pageDetailId ?? 0
                                
                                if self.movieId > 0 {
                                    self.tag = 1
                                }
                            }
                            .frame(width: 130, height: 175)
                            .cornerRadius(15)
                            .scaledToFit()
                            .clipped()
                    }
                }
                .frame(width: 150 * CGFloat(posterDetils.count), height: 180)
            }
        }
    }
}

struct HImageSVView_Previews: PreviewProvider {
    static var previews: some View {
        HImageSVView(title: "", posterDetils: [])
    }
}
