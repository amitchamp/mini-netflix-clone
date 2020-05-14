//
//  Constant.swift
//  MiniNetflixClone
//
//  Created by Sumit on 12/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation

class Constant {
    
    static let BASE_URL: String = "https://api.themoviedb.org/3/"
    static let API_KEY: String = "XXXXXXXXXXXXXXXXXX"
    
    static func getNetwokUrl(endPoint: String) -> String {

        return Constant.BASE_URL + endPoint + "?api_key=" + API_KEY + "&language=en-US&page=1"
    }
}
