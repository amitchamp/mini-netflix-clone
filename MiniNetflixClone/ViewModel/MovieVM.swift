//
//  MovieVM.swift
//  MiniNetflixClone
//
//  Created by Sumit on 08/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation
import Combine

class MovieVM: ObservableObject {
    var movieRequestUrl: String = ""

    @Published var movieData = [Movie]()
    @Published var movieDetail: MovieDetail?

    func getMovieListLoad(url: String) {
        self.movieRequestUrl = Constant.getNetwokUrl(endPoint: url)
        self.getMovieLista()
    }
    
    func getMovieDetail(url: String) {
        self.downloadMovieDetail(url: Constant.getNetwokUrl(endPoint: url))
    }
    
    private func getMovieLista() {
        MovieServices.getTopRatedMovies(url: self.movieRequestUrl) { movieData in
            if let movieData = movieData {
                DispatchQueue.main.async {
                    self.movieData = movieData
                }
            }
        }
    }
    
    private func downloadMovieDetail(url: String) {
        MovieServices.getMovieDetail(url: url) { (movieDetail) in
            if let movieDetail = movieDetail {
                DispatchQueue.main.async {
                    self.movieDetail = movieDetail
                }
            }
        }
    }
}
