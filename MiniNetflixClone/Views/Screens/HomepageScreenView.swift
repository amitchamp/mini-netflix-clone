//
//  HomepageScreenView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 07/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct HomepageScreenView: View {

    @ObservedObject var movieVM: MovieVM = MovieVM()
    @ObservedObject var latestMovie: MovieVM = MovieVM()

    var body: some View {
        let moviesPosterUrls = self.getPosterUrl(movies: self.movieVM.movieData)
        let latesMoviesPosterUrls = self.getPosterUrl(movies: self.latestMovie.movieData)

        return NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        PopularSliderView()
                            .frame(height: 260)

                        MovieCategoryView()
                            .frame(height: 90)
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 30)
                        
                        HImageSVView(tag: 0, title: "Trending", posterDetils: moviesPosterUrls)
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 30)
                        
                        HImageSVView(tag: 0, title: "Upcoming", posterDetils: latesMoviesPosterUrls)
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 30)
                    }
                }
            }
            .navigationBarTitle("Netflix", displayMode: .inline)
            .navigationBarItems(leading: HStack {
                    Image("menu")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .imageScale(.small)
                
                }, trailing: HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .imageScale(.small)
                }
            )
            .onAppear {
                self.movieVM.getMovieListLoad(url: "movie/top_rated")
                self.latestMovie.getMovieListLoad(url: "movie/upcoming")
            }
        }
    }
    
    private func getPosterUrl(movies: [Movie]) -> [PosterRedirect] {
        var posterImageUrls: [PosterRedirect] = [PosterRedirect]()

        for movie in movies {
            posterImageUrls.append(PosterRedirect(posterUrl: movie.poster_path, pageDetailId: movie.id))
        }
        
        return posterImageUrls
    }
}

struct HomepageScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageScreenView()
    }
}
