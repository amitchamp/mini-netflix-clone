//
//  CastNCrew.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation

struct Cast: Decodable, Hashable {
    var id: Int
    var name: String
    var profile_path: String?
}

struct CastList: Decodable {
    var id: Int
    var cast: [Cast]
    var crew: [Cast]
}
