//
//  Movie.swift
//  MiniNetflixClone
//
//  Created by Sumit on 08/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation

struct Movie: Decodable, Hashable {
    var id: Int
    var title: String
    var poster_path: String
}

struct MovieDetail: Decodable, Hashable {
    var id: Int
    var title: String
    var genres: [Genres]
    var runtime: Int
    var vote_average: Float
    var poster_path: String
    var release_date: String
    var vote_count: Int
    var overview: String
}

struct MovieList: Decodable {
    var results: [Movie]
}

struct Genres: Decodable, Hashable {
    var id: Int
    var name: String
}

