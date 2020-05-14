//
//  MovieDetailScreenView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 07/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct MovieDetailScreenView: View {
    
    @ObservedObject var movieVM: MovieVM = MovieVM()
    @ObservedObject var castNCrewVM: CastNCrewVM = CastNCrewVM()
    
    let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId

        UINavigationBar.appearance().tintColor = UIColor(named: "DarkRed")
    }

    struct MyRectangularShape: Shape {
        
        var corner : UIRectCorner
        var radii : CGFloat
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: radii, height: radii))

            return Path(path.cgPath)
        }
    }

    var body: some View {
        let movieDetail: MovieDetail = self.movieVM.movieDetail ?? MovieDetail(id: 1, title: "", genres: [], runtime: 1, vote_average: 12.12, poster_path: "", release_date: "", vote_count: 1, overview: "String")
        
        return GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    ZStack(alignment: .bottom) {
                        RemoteImageView(imageUrl: movieDetail.poster_path, imageWidth: "original")
                            .scaledToFill()
                            .frame(width: geometry.size.width + 175, height: 400)
                            .clipShape(MyRectangularShape(corner: .topLeft, radii: geometry.size.width / 2))
                            .shadow(color: Color.gray, radius: 20)
                        
                        ZStack(alignment: .center) {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 75, height: 75)
                                .offset(x: 0, y: 30)
                                .shadow(color: Color.gray, radius: 20)
                            
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("DarkRed"))
                                .offset(x: 2, y: 32)
                        }
                    }
                    
                    Spacer(minLength: 60)
                    
                    VStack(alignment: .center, spacing: 5) {
                        Text(movieDetail.title.uppercased())
                            .bold()
                            .font(.system(size: 20))
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                        
                        Text(self.getMovieGenres(genres: movieDetail.genres))
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)

                        Spacer(minLength: 8)

                        StarRating(rating: movieDetail.vote_average / 2.0)
                        
                        Spacer(minLength: 8)
                        
                        HStack(spacing: 18) {
                            VStack {
                                Text("Year")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.gray)

                                Text(self.getReleaseYear(releaseDate: movieDetail.release_date))
                                    .font(.system(size: 17))
                            }

                            VStack {
                               Text("Vote")
                                   .font(.system(size: 14))
                                   .foregroundColor(Color.gray)

                                Text("\(movieDetail.vote_count)")
                                   .font(.system(size: 17))
                           }

                            VStack {
                                Text("Length")
                                   .font(.system(size: 14))
                                   .foregroundColor(Color.gray)

                                Text("\(movieDetail.runtime) min")
                                   .font(.system(size: 17))
                           }
                        }

                        Spacer(minLength: 6)
                        
                        Text(movieDetail.overview)
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                        
                        
                        CastNCrewView(castNCrewList: self.castNCrewVM.castNCrew ?? CastList(id: 1, cast: [], crew: []))

                    }
                    .frame(width: geometry.size.width)
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding([.leading, .trailing], 20)
        .onAppear{
            self.movieVM.getMovieDetail(url: "movie/\(self.movieId)")
            self.castNCrewVM.getCastNCrew(url: "movie/\(self.movieId)/credits")
        }
    }
    
    private func getMovieGenres(genres: [Genres]) -> String {
        var allGeneres = ""

        for genreTitle in genres {
            allGeneres += genreTitle.name + ", "
        }
        
        return String(allGeneres.dropLast(2))
    }
    
    private func getReleaseYear(releaseDate: String) -> String {
        let splitReleaseDate = releaseDate.components(separatedBy: "-")

        return String(splitReleaseDate[0])
    }
}

struct MovieDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreenView(movieId: 0)
    }
}
