//
//  PopularSliderView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct PopularSliderView: View {

    @ObservedObject var popularMovies: MovieVM = MovieVM()
    @ObservedObject var groupedNetworkingImageVM: GroupedNetworkingImageVM = GroupedNetworkingImageVM(imagesUrl: [])

    init() {
        self.popularMovies.getMovieListLoad(url: "movie/popular")
    }
    
    func popularPosterImages(movieData: [Movie]) {
        var moviesPoster: [String] = [String]()

        if movieData.count > 0 {
            for movie in movieData {
                moviesPoster.append("http://image.tmdb.org/t/p/w500" + movie.poster_path)
            }
        }
        
        if moviesPoster.count > 0 && groupedNetworkingImageVM.imagesData.isEmpty {
            groupedNetworkingImageVM.imageDownloadByUrl(imagesUrl: moviesPoster)
        }
    }

    var body: some View {
        self.popularPosterImages(movieData: self.popularMovies.movieData)

        return Group {
            HomePageCarouselView(imageData: self.groupedNetworkingImageVM.imagesData)
        }
    }
}

struct PopularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        PopularSliderView()
    }
}
