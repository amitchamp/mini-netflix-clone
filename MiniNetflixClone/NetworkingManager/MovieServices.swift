//
//  MovieServices.swift
//  MiniNetflixClone
//
//  Created by Sumit on 08/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation

class MovieServices {
    
    static func getTopRatedMovies(url: String, completion: @escaping ([Movie]?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let movieResponse = try? JSONDecoder().decode(MovieList.self, from: data)
            if let movieListResponse = movieResponse {
                completion(movieListResponse.results)
                return
            }
            
            completion(nil)
            return
        }.resume()
    }
    
    static func getMovieDetail(url: String, completion: @escaping (MovieDetail?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieDetail.self, from: data)
            if let movieDetailResponse = movieResponse {
                completion(movieDetailResponse)
                return
            }
            
            completion(nil)
            return
        }.resume()
    }
}
